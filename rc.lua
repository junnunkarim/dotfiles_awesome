-- The awesomewm configurations I have written are in the declarative style as much as possible

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("awful.autofocus")

require("core")
require("visual")
