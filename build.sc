import $ivy.`com.goyeau::mill-scalafix:0.2.5`
import com.goyeau.mill.scalafix.ScalafixModule
import mill._, scalalib._, scalafmt._

val spinalVersion = "1.6.0"

object poseidon extends ScalaModule with ScalafmtModule with ScalafixModule {
  def scalaVersion = "2.12.14"

  override def scalacOptions = Seq(
    "-feature",
    "-deprecation",
    "-unchecked",
    //"-Werror",
    //"-Wunused:imports,patvars,privates,locals,explicits,implicits,params,linted",
    "-Xlint:adapted-args",
    "-Xlint:nullary-unit",
    "-Xlint:inaccessible",
    // "-Xlint:nullary-override", not a valid choice for -Xlint
    "-Xlint:infer-any",
    "-Xlint:missing-interpolator",
    "-Xlint:doc-detached",
    "-Xlint:private-shadow",
    "-Xlint:type-parameter-shadow",
    "-Xlint:poly-implicit-overload",
    "-Xlint:option-implicit",
    "-Xlint:delayedinit-select",
    "-Xlint:package-object-classes",
    "-Xlint:stars-align",
    "-Xlint:constant",
    "-Xlint:unused",
    //"-Xlint:nonlocal-return",
    //"-Xlint:implicit-not-found",
    //"-Xlint:serial",
    //"-Xlint:valpattern",
    //"-Xlint:eta-zero",
    //"-Xlint:eta-sam",
    "-Xlint:deprecation",
    "-Xfatal-warnings"
    //"-Ycache-plugin-class-loader:last-modified",
    //"-Ycache-macro-class-loader:last-modified",
    //"-Xexperimental",
    //"-P:semanticdb:synthetics:on",
    //"-P:semanticdb:failures:warning",
    //"-P:semanticdb:sourceroot:/Users/twer/workspace/Binding.scala",
    //"-Yrangepos",
    //"-Xplugin-require:semanticdb",
    //"-Xpluginsdir:~/.cache/coursier/v1/https/repo1.maven.org/maven2/",
    //"-Xplugin-list"
  )

  override def millSourcePath = os.pwd
  def ivyDeps = Agg(
    ivy"com.github.spinalhdl::spinalhdl-core:$spinalVersion",
    ivy"com.github.spinalhdl::spinalhdl-lib:$spinalVersion"
  )
  def scalacPluginIvyDeps = Agg(ivy"com.github.spinalhdl::spinalhdl-idsl-plugin:$spinalVersion")
}
