local gears = require("gears")
local wibox = require("wibox")

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


time_core = wibox.widget{
  { -- layout
    { -- margin
      { -- widget
        font = "Iosevka Nerd Font Mono 30",
        markup = '<span color="' .. other_colors.dark .. '"><b></b></span>',
        halign = "center",
        valign = "center",
        widget = wibox.widget.textbox
      },
      margins = {
        left = 10,
        right = 10,
      },
      widget = wibox.container.margin
    },
    bg = time_colors.dark,
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
    end,
    widget = wibox.container.background,
  },
  { -- margin
    { -- widget
      font = "Iosevka Nerd Font Mono 15",
      widget = wibox.widget.textclock(
        '<span color="' .. other_colors.dark .. '"><b>%I:%M %p</b></span>',
        61
      )
    },
    margins = {
      left = 10,
      right = 20,
    },
    widget = wibox.container.margin
  },
  widget = wibox.layout.fixed.horizontal
}

time = wibox.widget {
  time_core,

  shape = function(cr, w, h)
    return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
  end,
  shape_border_width = 3,
  shape_border_color = time_colors.dark,
  bg = time_colors.light,
  widget = wibox.container.background,
}
