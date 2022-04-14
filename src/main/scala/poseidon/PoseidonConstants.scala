package poseidon
import spinal.core._
import spinal.lib._
import scala.io.Source

object get_matrix_from_file {
  def apply(row: Int, column: Int, filename: String) = {
    val file = Source.fromFile(filename)
    val data = file
      .getLines()
      .filter(!_.equals(""))
      .map(BigInt(_, radix = 10))
      .toList
    val matrix = Array.ofDim[BigInt](row, column)
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
  val mdsMatrix = get_matrix_from_file(t, t, filename.format(t))
  val matrixTranspose = for (i <- 0 until t) yield mdsMatrix.map(_(i))
  val mdsRoms =
    for (i <- 0 until t)
      yield Mem(
        UInt(dataWidth bits),
        initialContent = matrixTranspose(i).map(U(_))
      )
  for (i <- 0 until t) {
    io.dataPorts(i) := mdsRoms(i).readAsync(io.addressPort)
  }

}

case class RoundConstantsConfig(
    t: Int,
    roundNum: Int,
    portsNum: Int,
    dataWidth: Int,
    memType: Boolean // memType=true: distributed memory memTpye=false: block ram
)

case class ReadPort(tMax: Int, roundMax: Int, dataWidth: Int) extends Bundle {
  val data = out UInt (dataWidth bits)
  val tIndex = in UInt (log2Up(tMax) bits)
  val roundIndex = in UInt (log2Up(roundMax) bits)
}

case class RoundConstants(config: RoundConstantsConfig) extends Component {
  val io = new Bundle {
    val readPorts = Vec(
      ReadPort(config.t, config.roundNum, config.dataWidth),
      config.portsNum
    )
  }
  val filename =
    "./poseidon_constants/round_constants_ff/round_constants_ff_%d.txt"
  val constantsMatrix =
    get_matrix_from_file(config.roundNum, config.t, filename.format(config.t))
  val matrixTranspose =
    for (i <- 0 until config.t) yield constantsMatrix.map(_(i))
  val constantsRoms =
    for (i <- 0 until config.t)
      yield Mem(UInt(config.dataWidth bits), matrixTranspose(i).map(U(_)))

  for (port <- io.readPorts) {
    val dataVec = if (config.memType) {
      constantsRoms.map(_.readAsync(port.roundIndex))
    } else {
      constantsRoms.map(_.readSync(port.roundIndex))
    }
    port.data := dataVec(port.tIndex)
  }

}

object RoundConstantsT3 {
  def apply(memType: Boolean): RoundConstants = {
    val config =
      RoundConstantsConfig(
        t = 3,
        roundNum = 63,
        portsNum = 1,
        dataWidth = 255,
        memType = memType
      )
    RoundConstants(config)
  }
}

object RoundConstantsT5 {
  def apply(memType: Boolean): RoundConstants = {
    val config =
      RoundConstantsConfig(
        t = 5,
        roundNum = 64,
        portsNum = 1,
        dataWidth = 255,
        memType = memType
      )
    RoundConstants(config)
  }
}

object RoundConstantsT9 {
  def apply(memType: Boolean): RoundConstants = {
    val config =
      RoundConstantsConfig(
        t = 9,
        roundNum = 65,
        portsNum = 1,
        dataWidth = 255,
        memType = memType
      )
    RoundConstants(config)
  }
}

object RoundConstantsT12 {
  def apply(memType: Boolean): RoundConstants = {
    val config =
      RoundConstantsConfig(
        t = 12,
        roundNum = 65,
        portsNum = 1,
        dataWidth = 255,
        memType = memType
      )
    RoundConstants(config)
  }
}

object MDSMatrixVerilog {
  def main(args: Array[String]): Unit = {
    SpinalVerilog(MDSMatrix(t = 3, dataWidth = 256))
  }
}

object RoundConstantsVerilog {
  val myconfig =
    RoundConstantsConfig(
      t = 3,
      roundNum = 63,
      portsNum = 3,
      dataWidth = 255,
      memType = false
    )

  def main(args: Array[String]): Unit = {
    SpinalVerilog(RoundConstants(myconfig))
  }
}
