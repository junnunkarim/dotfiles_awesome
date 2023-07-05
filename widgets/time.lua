local gears = require("gears")
local wibox = require("wibox")

-- Create a textclock widget
--clock = wibox.widget.textclock('<span font="Iosevka Nerd Font Mono 20"></span> <span font="Iosevka Nerd Font Mono 10">%I:%M %p</span> ', 60)
time_core = wibox.widget{
  { -- layout
    { -- container
      { -- widget
        font = "Iosevka Nerd Font Mono 20",
        markup = "<b>  </b>",
        halign = "center",
        valign = "center",
        widget = wibox.widget.textbox
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
    { -- widget
      font = "Iosevka Nerd Font Mono 15",
      widget = wibox.widget.textclock(' <b>%I:%M %p</b> ', 61)
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
