local gears = require("gears")
local wibox = require("wibox")

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


app_launcher = wibox.widget{
  { -- widget
    font = "Iosevka Nerd Font Mono 20",
    markup = '<b> 󰣇 </b>',
    halign = "center",
    valign = "center",
    widget = wibox.widget.textbox
  },
  bg = app_launcher_colors.light,
  shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
  end,
  shape_border_width = 3,
  shape_border_color = app_launcher_colors.dark,
  widget = wibox.container.background,
}
