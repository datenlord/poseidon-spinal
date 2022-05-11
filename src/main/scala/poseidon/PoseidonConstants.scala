package poseidon
import spinal.core._
import spinal.lib._
import scala.io.Source

object ReadMatrixFromFile {
  def apply(row: Int, column: Int, filename: String) = {
    val file = Source.fromFile(filename)
    val data = file
      .getLines()
      .filter(!_.equals(""))
      .map(BigInt(_, radix = 10))
      .map(U(_))
      .toList
    val matrix = Array.ofDim[UInt](row, column)
    for (i <- 0 until row) {
      for (j <- 0 until column) {
        matrix(i)(j) = data(i * column + j)
      }
    }
    matrix
  }
}



object MDSMatrix {
  def apply(t: Int, dataWidth: Int, address: UInt): Vec[UInt] = {
    val matrixInst = MDSMatrix(t, dataWidth)
    matrixInst.io.addressPort := address
    matrixInst.io.dataPorts
  }
}

case class MDSMatrix(t: Int, dataWidth: Int) extends Component {

  val io = new Bundle {
    val dataPorts = Vec((out UInt (dataWidth bits)), t)
    val addressPort = in UInt (log2Up(t) bits)
  }

  val filename =
    "./poseidon_constants/mds_matrixs_ff/mds_matrix_ff_%d.txt"
  val mdsMatrix = ReadMatrixFromFile(t, t, filename.format(t))
  val matrixTranspose = for (i <- 0 until t) yield mdsMatrix.map(_(i))
  val mdsRoms =
    for (i <- 0 until t)
      yield Mem(
        UInt(dataWidth bits),
        initialContent = matrixTranspose(i)
      )
  for (i <- 0 until t) {
    io.dataPorts(i) := mdsRoms(i).readAsync(io.addressPort)
  }

}

object RoundConstantMem {
  def latency(g:PoseidonGenerics):Int = {
    1 + (if(g.constantMemType) 1 else 0)
  }

  def apply(size: Int, g: PoseidonGenerics, stateIndex: UInt, rIndex: UInt): UInt = {
    val memInst = RoundConstantMem(size, g)
    memInst.io.stateIndex := stateIndex
    memInst.io.roundIndex := rIndex
    memInst.io.constant
  }
}

case class RoundConstantMem(size: Int, g: PoseidonGenerics)
    extends Component {

  val io = new Bundle {
    val stateIndex = in UInt (log2Up(g.sizeMax) bits)
    val roundIndex = in UInt (log2Up(g.roundMax) bits)
    val constant   = out UInt (g.dataWidth bits)
  }

  val filePath =
    "./poseidon_constants/round_constants_ff/round_constants_ff_%d.txt"
  val constantsMat = ReadMatrixFromFile(
    PoseidonParam.fullRound + PoseidonParam.partialRoundMap(size),
    size,
    filePath.format(size)
  )
  val matTranspose = for (i <- 0 until size) yield constantsMat.map(_(i))
  val memInst = matTranspose.map(Mem(UInt(g.dataWidth bits), _))
  val memOutput = if(g.constantMemType){
    memInst.map( _.readSync(io.roundIndex.resized) )
  } else{
    memInst.map( _.readAsync(io.roundIndex.resized) )
  }

  val stateIndex = if(g.constantMemType) RegNext(io.stateIndex) else io.stateIndex
  io.constant := RegNext(memOutput(stateIndex.resized))
  val latency = 1 + (if(g.constantMemType) 1 else 0)
}


case class RoundConstantMemAddr(g:PoseidonGenerics) extends Bundle{
  val stateSize = UInt(log2Up(g.sizeMax) bits)
  val stateIndex = UInt(log2Up(g.sizeMax) bits)
  val roundIndex = UInt(log2Up(g.roundMax) bits)
}

object RoundConstant{

  def latency(g:PoseidonGenerics):Int = {
    RoundConstantMem.latency(g) + 1
  }

  def apply(g:PoseidonGenerics, addr:RoundConstantMemAddr):UInt = {
    val memInst = RoundConstant(g)
    memInst.io.addr := addr
    memInst.io.data
  }
}
case class RoundConstant(g:PoseidonGenerics) extends Component{
  val io = new Bundle{
    val addr = in(RoundConstantMemAddr(g))
    val data = out UInt(g.dataWidth  bits)
  }

  val constantVec = PoseidonParam.sizeRange.map(
    RoundConstantMem(_, g, io.addr.stateIndex, io.addr.roundIndex)
  )
  val sizeDelayed = Delay(io.addr.stateSize, RoundConstantMem.latency(g))
  val sizeSelect = PoseidonParam.sizeRange.map(_ === sizeDelayed)
  io.data := RegNext( MuxOH(sizeSelect, constantVec) )
  val latency = RoundConstantMem.latency(g) + 1
}


object MDSMatrixVerilog {
  def main(args: Array[String]): Unit = {
    SpinalVerilog(MDSMatrix(t = 3, dataWidth = 256))
  }
}



object MDSMatrixRowMem{
  val latency = 3
  def apply(g:PoseidonGenerics, peTag:Int, rowNum:Int, colIndex:UInt, stateSize:UInt):UInt={
    require(peTag < g.peNum, "peTage is out of range")
    val rowNumMax = g.sizeMax/g.peNum + (if(g.sizeMax%g.peNum == 0) 0 else 1)
    require(rowNum < rowNumMax, "rowNum is out of range")

    val memInst = MDSMatrixRowMem(g, peTag, rowNum)
    memInst.io.colIndex := colIndex
    memInst.io.stateSize := stateSize
    memInst.io.constant
  }
}

// Memory of one row of mds matrix of different sizes
case class MDSMatrixRowMem(g:PoseidonGenerics, peTag:Int, rowNum:Int) extends Component{
  val io = new Bundle{
    val colIndex  = in UInt(log2Up(g.sizeMax) bits)
    val stateSize = in UInt(log2Up(g.sizeMax) bits)
    val constant  = out UInt(g.dataWidth bits)
  }
  import PoseidonParam._
  val mdsMatrices = sizeRange.map(
    size => ReadMatrixFromFile(
      row = size,
      column = size,
      filename = s"./poseidon_constants/mds_matrixs_ff/mds_matrix_ff_$size.txt"
    )
  )

  val matrixRows = Vec(UInt(g.dataWidth bits), sizeRange.length)
  for(i <- 0 until sizeRange.length){
    val rowIndex = rowNum * g.peNum + peTag
    if(rowIndex > sizeRange(i) - 1){
      matrixRows(i) := U(0, g.dataWidth bits)
    }
    else{
      val tempColIndex = RegNext(io.colIndex).setName(s"tempColIndex_$i")
      val matrixRowMem = Mem(
        UInt(g.dataWidth bits), mdsMatrices(i)(rowIndex)
      ).setName("matrixRowMem_size_%d_row_%d".format(sizeRange(i),rowIndex))
      matrixRows(i) := matrixRowMem.readSync(tempColIndex.resized)
    }
  }

  val tempStateSize = Delay(io.stateSize, 2)
  val sizeSelect = sizeRange.map(_ === tempStateSize)
  io.constant := RegNext(MuxOH(sizeSelect, matrixRows))
}

case class PEMemAddr(g:PoseidonGenerics) extends Bundle{
  val rowIndex  = UInt(log2Up(g.sizeMax) bits)
  val colIndex  = UInt(log2Up(g.sizeMax) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
}

// MDS Matrix Constants Memory for Processing Element
object  PEConstantMem{
  val latency = MDSMatrixRowMem.latency + 1
  def apply(g:PoseidonGenerics, peTag:Int, addr:PEMemAddr):UInt = {
    val memInst = PEConstantMem(g, peTag)
    memInst.io.addr := addr
    memInst.io.data
  }
}

case class PEConstantMem(g:PoseidonGenerics, peTag:Int) extends Component{

  val io = new Bundle{
    val addr = in (PEMemAddr(g))
    val data = out UInt(g.dataWidth bits)
  }

  val rowNumMax = g.sizeMax/g.peNum + (if(g.sizeMax % g.peNum==0) 0 else 1)
  val rowIndexRange = (0 until rowNumMax).map(_ * g.peNum + peTag)

  val tempRowIndex = Delay(io.addr.rowIndex, MDSMatrixRowMem.latency)
  val rowSelect = rowIndexRange.map(tempRowIndex === _)
  val rowOutputs = (0 until rowNumMax).map(
    rowNum => MDSMatrixRowMem(g, peTag, rowNum, io.addr.colIndex, io.addr.stateSize)
  )
  io.data := RegNext(MuxOH(rowSelect, rowOutputs))
}

object MDSMatrixRowMemVerilog{
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 3,
      dataWidth = 255,
      idWidth = 8,
      isSim = false,
      constantMemType = false
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(MDSMatrixRowMem(config, 0, 1))
  }
}


object PEConstantMemVerilog{
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundMax = 65,
      loopNum = 3,
      dataWidth = 255,
      idWidth = 8,
      isSim = false,
      constantMemType = false
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(PEConstantMem(config, 0))
  }
}

