name := "RV32"

version := "1.0"

scalaVersion := "2.11.12"

// val spinalHDLVersion = "latest.release"
val spinalHDLVersion = "1.7.3"

EclipseKeys.withSource := true

// for dev branch with workaround features that will be in next releases
libraryDependencies ++= Seq(
  "com.github.spinalhdl" % "spinalhdl-core_2.11" % spinalHDLVersion,
  "com.github.spinalhdl" % "spinalhdl-lib_2.11" % spinalHDLVersion,
  compilerPlugin("com.github.spinalhdl" % "spinalhdl-idsl-plugin_2.11" % spinalHDLVersion)
)

// for stable, master branch of spinalhdl
// libraryDependencies ++= Seq(
//   "com.github.spinalhdl" % "spinalhdl-core_2.11" % "1.3.8",
//   "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "1.3.8",
//   //compilerPlugin("com.github.spinalhdl" % "spinalhdl-idsl-plugin_2.11" % "1.3.8")
// )

fork := true
