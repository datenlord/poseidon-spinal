package poseidon
import spinal.core._
import spinal.lib._
import scala.io.Source

object ReadConstantsFromFile {
  def matrix(row: Int, column: Int, fileName: String, radix: Int) = {
    val file = Source.fromFile(fileName)
    val data = file
      .getLines()
      .filter(!_.equals(""))
      .map(BigInt(_, radix))
      .map(U(_))
      .toArray

    val UIntMatrix = Array.ofDim[UInt](row, column)
    for (i <- 0 until row) {
      for (j <- 0 until column) {
        UIntMatrix(i)(j) = data(i * column + j)
      }
    }
    UIntMatrix
  }

  def vector(fileName: String, radix: Int): Array[UInt] = {
    val stringVec = Source.fromFile(fileName).getLines().filter(!_.equals(""))
    val UIntVec = stringVec.map(BigInt(_, radix)).map(U(_)).toArray
    UIntVec
  }
}

case class MatMemConfig(
    row: Int,
    column: Int,
    dataWidth: Int,
    filePath: String,
    memType: Boolean = false
)
object MatrixConstantMem {
  def apply(config: MatMemConfig, addr: UInt): Vec[UInt] = {
    val matrixInst = MatrixConstantMem(config)
    matrixInst.io.addr := addr
    matrixInst.io.data
  }
}

case class MatrixConstantMem(g: MatMemConfig) extends Component {

  val io = new Bundle {
    val data = Vec((out UInt (g.dataWidth bits)), g.column)
    val addr = in UInt (log2Up(g.row) bits)
  }

  val mdsMatrix = ReadConstantsFromFile.matrix(g.row, g.column, g.filePath, 16)
  val matTranspose = for (i <- 0 until g.column) yield mdsMatrix.map(_(i))
  val mdsMem = matTranspose.map(Mem(UInt(g.dataWidth bits), _))

  // TODO: cut high fan out
  val tempAddrVec = Vec(UInt(log2Up(g.row) bits), g.column)
  tempAddrVec.foreach(_ := RegNext(io.addr))
  if (g.memType) {
    for (i <- 0 until g.column) {
      io.data(i) := mdsMem(i).readAsync(tempAddrVec(i))
    }
  } else {
    for (i <- 0 until g.column) {
      io.data(i) := mdsMem(i).readSync(tempAddrVec(i))
    }
  }

}

object PreRoundConstants {
  val constantsT3 = Seq(
    BigInt(
      "2a175464246e8941586440d29d17a3e801c1bdf20d09026b23e366d1c822c12d",
      radix = 16
    ),
    BigInt(
      "600fd1b8363956cbdbfb4087da06af8ec28b6be869a2cf82dd35fb45585c6aed",
      radix = 16
    ),
    BigInt(
      "69212d4e6495f3683deb63f13fe00e4249df84165dccb57f3fa379d7e2b8bfbe",
      radix = 16
    )
  )

  val constantsT5 = Seq(
    BigInt(
      "33ff809e7dbdebbf8f644337a0008dcf305605b2cb53223d3d0a4729368cfb9f",
      radix = 16
    ),
    BigInt(
      "4998feed41b4cddf2572ea256be885d0503170b7205090679e52ce58a4182072",
      radix = 16
    ),
    BigInt(
      "27ae16683e3a7acc2302dadf7a5fa9c5034410574ac64bd6578b2978864d447c",
      radix = 16
    ),
    BigInt(
      "5ec0e948c78bc2c24fbe333d330cfb35307db01f23092d8c6d3a7acd0bbd8dd7",
      radix = 16
    ),
    BigInt(
      "73b33c1d097fe58c0b7c1572fafa5f3067d901cf30252eee2cb4d18b3637e7e5",
      radix = 16
    )
  )

  val constantsT9 = Seq(
    BigInt(
      "61164ad53d961f8c5d71b17b8762cfe5b80a09c3770458818eb749221c5777b2",
      radix = 16
    ),
    BigInt(
      "629457753f89131cd47ba9d8cd6946fe4d9710737560c27a773d3406a8f372e5",
      radix = 16
    ),
    BigInt(
      "7107e746a7f5d03edf182e037acdc21dc049822362518bf52fcfc516572100c6",
      radix = 16
    ),
    BigInt(
      "6d682d57c2f77a87982f101aa874cc41716286f9625d3d92a968983a5ef53811",
      radix = 16
    ),
    BigInt(
      "5af7e3d8f26afd924b8d17a25ff21fe5e1d792d5f295095fb676e1da058ed62f",
      radix = 16
    ),
    BigInt(
      "1df39ecbc80f8cd77fe8ecebd38a68bd8e96c48fda8e055c41b143e41b03fa28",
      radix = 16
    ),
    BigInt(
      "130c8a1cdc46a1feaf252450edd7afc1810f5fe59bc15438855be06daacb38ca",
      radix = 16
    ),
    BigInt(
      "1caed2dbef24448b570ba85bacd8d8a59674e1b0da119872e2a4a3fb359dcf90",
      radix = 16
    ),
    BigInt(
      "5d2a5445b34a8c40f1642337f13047a2767d87551c943519380312717f01c615",
      radix = 16
    )
  )
  val constantsT12 = Seq(
    BigInt(
      "17fa0c9a759f5b22f592e9170b46d35bec219c80c7f1f34d70bd48a2f2f6061f",
      radix = 16
    ),
    BigInt(
      "1e380507358adb0dd4c8ff7007bd1f1f7fdf2350c0a4989b04f0d4cf72dc5c77",
      radix = 16
    ),
    BigInt(
      "55baa6a9addd6703ae3a88059aeaf8176f3453533910eee7002dc13c81bfb07",
      radix = 16
    ),
    BigInt(
      "59afa6e185c556f0c46834f185695aef105089c669bcebe48ffe7e848165e138",
      radix = 16
    ),
    BigInt(
      "18e3e88a35ed841034d08f4c86633376a5404c484cf7e63bc4690dc8f2a12121",
      radix = 16
    ),
    BigInt(
      "50f9329aad27d133c367c805dd6c5829ec24a9bd6d7a3cd9e7c46b528078d4d7",
      radix = 16
    ),
    BigInt(
      "69a4eef12806819f181f6ba6aefe9cbe9c663618e7e8ba4c5a96cdeb798f7579",
      radix = 16
    ),
    BigInt(
      "168c18dde57a2e4654bb324ccb241209c79ceb9b63830f21741b569b35071986",
      radix = 16
    ),
    BigInt(
      "49f8d58a75a960d871dfd1ba40e985c10e39911645f5d35fadbffe3695ebab04",
      radix = 16
    ),
    BigInt(
      "6163c52a1a4a5b5a4aad9cce14d6ffe6695d01abb6db317b877af0af830e804c",
      radix = 16
    ),
    BigInt(
      "591b0c6bed72f4e6fdff7700591f2435b85c0361c6b226e2774779cdb0fc6d2e",
      radix = 16
    ),
    BigInt(
      "586d4eacccd4167cf1538c8690df076bd88d48a64ea86aaecd6cda86c44450e0",
      radix = 16
    )
  )
  val constants = Seq(constantsT3, constantsT5, constantsT9, constantsT12)
}

object PreRoundConstantMem {
  def apply(g: PoseidonGenerics, stateSize: UInt, stateIndex: UInt): UInt = {
    val memInst = PreRoundConstantMem(g)
    memInst.io.stateSize := stateSize
    memInst.io.stateIndex := stateIndex
    memInst.io.preConstant
  }
}

case class PreRoundConstantMem(g: PoseidonGenerics) extends Component {
  val io = new Bundle {
    val stateSize = in UInt (log2Up(g.sizeMax) bits)
    val stateIndex = in UInt (log2Up(g.sizeMax) bits)
    val preConstant = out UInt (g.dataWidth bits)
  }

  val initialContent = PreRoundConstants.constants.map(_.map(U(_)))
  val memInst = initialContent.map(Mem(UInt(g.dataWidth bits), _))
  val memOutput = memInst.map(_.readAsync(io.stateIndex.resized))
  val select = PoseidonParam.sizeRange.map(io.stateSize === _)
  io.preConstant := MuxOH(select, memOutput)
}

object PartialRoundConstantMem {
  def apply(g: PoseidonGenerics, stateSize: UInt, roundp: UInt): UInt = {
    val memInst = PartialRoundConstantMem(g)
    memInst.io.stateSize := stateSize
    memInst.io.partialRound := roundp
    memInst.io.constant
  }
}

case class PartialRoundConstantMem(g: PoseidonGenerics) extends Component {
  val io = new Bundle {
    val stateSize = in UInt (log2Up(g.sizeMax) bits)
    val partialRound = in UInt (log2Up(g.roundp) bits)
    val constant = out UInt (g.dataWidth bits)
  }

  // read partial round constants from file
  val filePath =
    "./poseidon_constants/compressed_round_constants_ff/partial_round_constants_ff_%d.txt"
  val initialContent = PoseidonParam.sizeRange.map(size =>
    ReadConstantsFromFile.vector(filePath.format(size), 16)
  )
  val constantsMem = initialContent.map(Mem(UInt(g.dataWidth bits), _))
  val memOutputs = constantsMem.map(_.readAsync(io.partialRound.resized))
  val select = PoseidonParam.sizeRange.map(io.stateSize === _)
  io.constant := MuxOH(select, memOutputs)
}

object FullRoundConstantMem {
  def apply(size: Int, g: PoseidonGenerics, index: UInt, roundf: UInt): UInt = {
    val memInst = FullRoundConstantMem(size, g)
    memInst.io.stateIndex := index
    memInst.io.fullRound := roundf
    memInst.io.constant
  }
}

case class FullRoundConstantMem(size: Int, g: PoseidonGenerics)
    extends Component {

  val io = new Bundle {
    val stateIndex = in UInt (log2Up(g.sizeMax) bits)
    val fullRound = in UInt (log2Up(g.roundf) bits)
    val constant = out UInt (g.dataWidth bits)
  }

  val filePath =
    "./poseidon_constants/compressed_round_constants_ff/full_round_constants_ff_%d.txt"
  val constantsMat = ReadConstantsFromFile.matrix(
    PoseidonParam.fullRound,
    size,
    filePath.format(size),
    16
  )
  val matTranspose = for (i <- 0 until size) yield constantsMat.map(_(i))
  val memInst = matTranspose.map(Mem(UInt(g.dataWidth bits), _))
  val memOutput = memInst.map(_.readAsync(io.fullRound.resized))
  io.constant := memOutput(io.stateIndex.resized)
}

case class ConstantAddrPort(g: PoseidonGenerics) extends Bundle {
  val isFull = Bool()
  val fullRound = UInt(log2Up(g.roundf) bits)
  val partialRound = UInt(log2Up(g.roundp) bits)
  val stateIndex = UInt(log2Up(g.sizeMax) bits)
  val stateSize = UInt(log2Up(g.sizeMax) bits)
}

object RoundConstantMem {
  def apply(g: PoseidonGenerics, addr: ConstantAddrPort): UInt = {
    val memInst = RoundConstantMem(g)
    memInst.io.addr := addr
    memInst.io.data
  }
}

case class RoundConstantMem(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val addr = in(ConstantAddrPort(g))
    val data = out UInt (g.dataWidth bits)
  }

  val fullConstantsVec = PoseidonParam.sizeRange.map(
    FullRoundConstantMem(_, g, io.addr.stateIndex, io.addr.fullRound)
  )
  val select = PoseidonParam.sizeRange.map(_ === io.addr.stateSize)
  val fullConstant = MuxOH(select, fullConstantsVec)

  val partialConstant =
    PartialRoundConstantMem(g, io.addr.stateSize, io.addr.partialRound)
  io.data := Mux(io.addr.isFull, fullConstant, partialConstant)
}

object MDSConstantMem {
  val latency = 5
  def apply(g: PoseidonGenerics, addr: ConstantAddrPort): Vec[UInt] = {
    val memInst = MDSConstantMem(g)
    memInst.io.addr := addr
    memInst.io.data
  }
}

case class MDSConstantMem(g: PoseidonGenerics) extends Component {

  val io = new Bundle {
    val addr = in(ConstantAddrPort(g))
    val data = Vec(out UInt (g.dataWidth bits), g.sizeMax)
  }

  val outputWidth = g.dataWidth * g.sizeMax

  val fullRound = new Area {
    // full round Matrix constants
    val sizeDelayed1 = Delay(io.addr.stateSize, 2)
    val sizeSelect1 = PoseidonParam.sizeRange.map(_ === sizeDelayed1)

    // mds matrix
    val mdsPath = "./poseidon_constants/mds_matrixs_ff/mds_matrix_ff_%d.txt"
    val mdsConfigs = PoseidonParam.sizeRange.map(size =>
      MatMemConfig(size, size, g.dataWidth, mdsPath.format(size))
    )
    val mdsOutputs = mdsConfigs.map(
      MatrixConstantMem(_, io.addr.stateIndex.resized).asBits
        .resize(outputWidth)
    )
    val mdsOutput = RegNext(MuxOH(sizeSelect1, mdsOutputs))

    // pre sparse matrix
    val sizeDelayed2 = Delay(io.addr.stateSize, 2)
    val sizeSelect2 = PoseidonParam.sizeRange.map(_ === sizeDelayed2)

    val preSparsePath =
      "./poseidon_constants/pre_sparse_matrix_ff/pre_sparse_matrix_ff_%d.txt"
    val preSparseConfigs = PoseidonParam.sizeRange.map(size =>
      MatMemConfig(size, size, g.dataWidth, preSparsePath.format(size))
    )
    val preSparseOutputs = preSparseConfigs.map(
      MatrixConstantMem(_, io.addr.stateIndex.resized).asBits
        .resize(outputWidth)
    )
    val preSparseOutput = RegNext(MuxOH(sizeSelect2, preSparseOutputs))

    val fullRoundDelayed = Delay(io.addr.fullRound, 3)
    val output = RegNext(
      Mux(
        fullRoundDelayed === PoseidonParam.halfRoundf - 1,
        preSparseOutput,
        mdsOutput
      )
    )

  }

  val partialRound = new Area {
    // sparse mds matrix
    val sparseMatPath =
      "./poseidon_constants/sparse_matrix_ff/sparse_matrix_ff_%d.txt"
    val sparseMatT3 = RegNext(
      MatrixConstantMem(
        MatMemConfig(
          PoseidonParam.partialRoundMap(3),
          5,
          g.dataWidth,
          sparseMatPath.format(3)
        ),
        io.addr.partialRound.resized
      )
    )

    val sparseMatT5 = RegNext(
      MatrixConstantMem(
        MatMemConfig(
          PoseidonParam.partialRoundMap(5),
          9,
          g.dataWidth,
          sparseMatPath.format(5)
        ),
        io.addr.partialRound.resized
      )
    )

    val sparseRowPath =
      "./poseidon_constants/sparse_matrix_ff/sparse_matrix_row_ff_%d.txt"
    val sparseRowT9 = MatrixConstantMem(
      MatMemConfig(
        PoseidonParam.partialRoundMap(9),
        9,
        g.dataWidth,
        sparseRowPath.format(9)
      ),
      io.addr.partialRound.resized
    ).asBits

    val sparseRowT12 = MatrixConstantMem(
      MatMemConfig(
        PoseidonParam.partialRoundMap(12),
        12,
        g.dataWidth,
        sparseRowPath.format(12)
      ),
      io.addr.partialRound.resized
    ).asBits

    val sparseColPath =
      "./poseidon_constants/sparse_matrix_ff/sparse_matrix_column_ff_%d.txt"

    val sparseColT9 = MatrixConstantMem(
      MatMemConfig(
        PoseidonParam.partialRoundMap(9),
        9,
        g.dataWidth,
        sparseColPath.format(9)
      ),
      io.addr.partialRound.resized
    ).asBits

    val sparseColT12 = MatrixConstantMem(
      MatMemConfig(
        PoseidonParam.partialRoundMap(12),
        12,
        g.dataWidth,
        sparseColPath.format(12)
      ),
      io.addr.partialRound.resized
    ).asBits

    val indexDelayed1 = Delay(io.addr.stateIndex, 2)
    val indexDelayed2 = Delay(io.addr.stateIndex, 2)
    val sparseMatT9 = RegNext(
      Mux(indexDelayed1 === 0, sparseRowT9, sparseColT9)
    )
    val sparseMatT12 = RegNext(
      Mux(indexDelayed2 === 0, sparseRowT12, sparseColT12)
    )
    val sparseOutputs = Vec(
      sparseMatT3.asBits.resize(outputWidth),
      sparseMatT5.asBits.resize(outputWidth),
      sparseMatT9.resize(outputWidth),
      sparseMatT12
    )

    val sizeDelayed = Delay(io.addr.stateSize, 3)
    val sizeSelect = PoseidonParam.sizeRange.map(_ === sizeDelayed)
    val output = RegNext(MuxOH(sizeSelect, sparseOutputs))
  }

  val isFullDelayed = Delay(io.addr.isFull, 4)
  io.data.assignFromBits(
    RegNext(
      Mux(isFullDelayed, fullRound.output, partialRound.output)
    )
  )
}

object MatrixConstantMemVerilog {
  def main(args: Array[String]): Unit = {

    val memConfig = MatMemConfig(
      row = 3,
      column = 3,
      dataWidth = 255,
      filePath = "./poseidon_constants/mds_matrixs_ff/mds_matrix_ff_3.txt",
      memType = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(MatrixConstantMem(memConfig))

  }
}

object PreRoundConstantMemVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundp = 57,
      roundf = 8,
      dataWidth = 255,
      idWidth = 8,
      isSim = false
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(PreRoundConstantMem(config))

  }
}

object PartialRoundConstantMemVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundf = 8,
      roundp = 57,
      dataWidth = 255,
      idWidth = 8,
      isSim = false,
      constantMemType = false,
      transmitterQueue = 10,
      flowQueue = 20
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(PartialRoundConstantMem(config))
  }
}

object FullRoundConstantMemVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundf = 8,
      roundp = 57,
      dataWidth = 255,
      idWidth = 8,
      isSim = false
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(FullRoundConstantMem(3, config))
  }
}

object RoundConstantMemVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundf = 8,
      roundp = 57,
      dataWidth = 255,
      idWidth = 8,
      isSim = true
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(RoundConstantMem(config))
  }
}

object MDSConstantMemVerilog {
  def main(args: Array[String]): Unit = {
    val config = PoseidonGenerics(
      sizeMax = 12,
      roundf = 8,
      roundp = 57,
      dataWidth = 255,
      idWidth = 8,
      isSim = false
    )

    SpinalConfig(
      mode = Verilog,
      targetDirectory = "./src/main/verilog/"
    ).generate(MDSConstantMem(config))
  }
}
