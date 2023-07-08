local gears = require("gears")
local wibox = require("wibox")

-- Create a textclock widget
--clock = wibox.widget.textclock('<span font="Iosevka Nerd Font Mono 20"></span> <span font="Iosevka Nerd Font Mono 10">%I:%M %p</span> ', 60)
time_core = wibox.widget{
  { -- layout
    { -- container
      {
        { -- widget
          font = "Iosevka Nerd Font Mono 30",
          markup = '<span color="' .. other_colors.dark .. '"><b></b></span>',
          fg = "#282828",
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
      bg = "#689d6a",
      shape = function(cr, w, h)
        return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
      end,
      widget = wibox.container.background,
    },
    bg = "#8ec07c",
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, true, false, false, true, 20)
    end,
    widget = wibox.container.background,
  },
  { -- container
    { -- container
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
    bg = "#8ec07c",
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, false, true, true, false, 20)
    end,
    widget = wibox.container.background,
  },
  widget = wibox.layout.fixed.horizontal
}

-- adds border
time = wibox.widget {
  {
    {
      widget = time_core,
    },
    shape_border_width = 3,
    shape_border_color = "#689d6a",
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
    end,
    widget = wibox.container.background,
  },
  widget = wibox.layout.align.horizontal
}
