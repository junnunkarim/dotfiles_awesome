local gears = require("gears")
local wibox = require("wibox")

require("visual.options")
require("visual.themes." .. THEME_COLORSCHEME .. ".colors")


--[[
tray = wibox.widget{
  {
    wibox.widget.systray(),
    margins = {
      left = 15,
      right = 15,
    },
    widget = wibox.container.margin
  },
  bg = tray_colors.light,
  shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
  end,
  shape_border_width = 3,
  shape_border_color = tray_colors.dark,
  widget = wibox.container.background,
}
]]--

get_systray = function(s)
  tray = wibox.widget (
    {
      visible = false,
      widget = wibox.widget.systray(),
    }
  )

  return tray
end
