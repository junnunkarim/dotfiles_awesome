local gears = require("gears")
local beautiful = require("beautiful")

require("visual.options")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(os.getenv("HOME") .. "/.config/awesome/visual/themes/" .. THEME .. "/theme.lua")

-- round borders
-- -------------
client.connect_signal(
  "request::manage",
  function(c)
    c.shape = function(cr, w, h)
      gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20) -- t-left, t-right, b-right, b-left
    end
  end
)
