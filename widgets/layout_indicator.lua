local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

require("core.utils")

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


get_layout_indicator = function (s)
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  local layout_indicator = wibox.widget {
    {
      screen = s,
      buttons = {
        awful.button(
          { }, 1,
          function()
            awful.layout.inc(1)
          end
        ),
        awful.button(
          { }, 3,
          function()
            awful.layout.inc(-1)
          end
        ),
        awful.button(
          { }, 4,
          function()
            awful.layout.inc(-1)
          end
        ),
        awful.button(
          { }, 5,
          function()
            awful.layout.inc(1)
          end
        ),
      },
      widget = awful.widget.layoutbox
    },
    shape_border_width = 3,
    shape_border_color = other_colors.dark,
    bg = other_colors.dark,
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 5)
    end,
    widget = wibox.container.background,
  }

  return layout_indicator
end
