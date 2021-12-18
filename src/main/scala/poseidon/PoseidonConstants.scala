package poseidon
import spinal.core._
import spinal.lib._
import scala.io.Source



object get_matrix_from_file{
  def apply(row:Int,column:Int,filename:String) = {
    val file = Source.fromFile(filename)
    val data = file.getLines().filter(_!="").map(BigInt(_,radix = 10)).toList
    val matrix = Array.ofDim[BigInt](row,column)
    for(i <- 0 until row; j <- 0 until column){
      matrix(i)(j) = data(i*column + j)
    }
    matrix
  }
}

class MDSMatrix( t:Int , data_width:Int) extends Component{

  val io = new Bundle {
    val data_ports = Vec((out UInt(data_width bits)),t)
    val address_port = in UInt(log2Up(t) bits)
  }

  val filename = "./src/reference_model/poseidon_python/mds_matrixs_ff/mds_matrix_ff_%d.txt"
  val mds_matrix = get_matrix_from_file(t,t,filename.format(t))
  val matrix_transpose = for(i <- 0 until t) yield mds_matrix.map(_(i))
  val mds_roms   = for (i <- 0 until t) yield Mem(UInt(data_width bits),initialContent = matrix_transpose(i).map(U(_)))
  for (i <- 0 until t){
    io.data_ports(i) := mds_roms(i).readAsync(io.address_port)
  }

}

case class RoundConstantsConfig(t:Int,round_num:Int,ports_num:Int,data_width:Int){}

case class ReadPort(t_max:Int,round_max:Int,data_width:Int) extends Bundle{
  val data = out UInt(data_width bits)
  val t_index = in UInt(log2Up(t_max) bits)
  val round_index = in UInt(log2Up(round_max) bits)
}

class RoundConstants( config:RoundConstantsConfig) extends Component{
  val io = new Bundle{
    val read_ports = Vec(ReadPort(config.t,config.round_num,config.data_width),config.ports_num)
  }
  val filename = "./src/reference_model/poseidon_python/round_constants_ff/round_constants_ff_%d.txt"
  val constants_matrix = get_matrix_from_file( config.round_num, config.t, filename.format(config.t))
  val matrix_transpose = for(i <- 0 until config.t) yield constants_matrix.map(_(i))
  val constants_roms = for (i <- 0 until config.t) yield Mem(UInt(config.data_width bits),matrix_transpose(i).map(U(_)))

  for (port <- io.read_ports){
    val data_vec = constants_roms.map(_.readAsync(port.round_index))
    port.data := data_vec(port.t_index)
  }
}


object MDSMatrixVerilog {
  def main(args: Array[String]): Unit = {
    SpinalVerilog(new MDSMatrix(t = 3,data_width = 256))
  }
}

object RoundConstantsVerilog{
  val myconfig = RoundConstantsConfig(t=3,round_num = 63,ports_num = 3,data_width = 255)

  def main(args: Array[String]): Unit = {
    SpinalVerilog(new RoundConstants(myconfig))
  }
}



