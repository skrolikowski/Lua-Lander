package = "Lua-Lander"
version = "1.0-1"
source = {
   url = "git+ssh://git@github.com/skrolikowski/Lua-Lander.git",
   tag = "v1.0-1"
}
description = {
   detailed = "A modern utility library for Lua, offering tons of supplemental goodness for your projects.",
   homepage = "http://shanekrolikowski.com/Lua-Lander/",
   license = "MIT"
}
build = {
   type = "builtin",
   modules = {
      lua-lander = "init.lua"
   },
   copy_directories = {
      "docs"
   }
}
dependencies = {
   "lua >= 5.1",
   "lpeg >= 0.10-1"
}