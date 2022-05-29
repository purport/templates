require "ninja"
require "export-compile-commands"

workspace "Project"
  location ".build"
  configurations {"debug", "release"}

  project "hello-world"
    kind "ConsoleApp"
    language "C"
    targetdir "bin/%{cfg.buildcfg}"
    files { "include/*.h"; "src/*.c" }
    includedirs { "include" }

    filter "configurations:debug"
      defines { "DEBUG" }
      symbols "On"

    filter "configurations:eelease"
      defines { "NDEBUG" }
      optimize "On"
