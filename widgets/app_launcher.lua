local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


app_launcher = wibox.widget{
  {
    { -- widget
      font = "Iosevka Nerd Font Mono 20",
      markup = '<span color="' .. other_colors.dark .. '"><b>󰣇</b></span>',
      halign = "center",
      valign = "center",
      widget = wibox.widget.textbox
    },

    buttons = {
      awful.button(
        { }, 1,
        function()
          awful.spawn(os.getenv("HOME") .. "/.bin/rofi_run")
        end
      ),
    },
    margins = {
      left = 15,
      right = 15,
    },
    widget = wibox.container.margin
  },
  bg = app_launcher_colors.light,
  shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
  end,
  shape_border_width = 3,
  shape_border_color = app_launcher_colors.dark,
  widget = wibox.container.background,
}
