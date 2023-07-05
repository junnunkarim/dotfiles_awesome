local gears = require("gears")
local wibox = require("wibox")

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


date_core = wibox.widget{
  { -- layout
    { -- container
      { -- widget
        font = "Iosevka Nerd Font Mono 20",
        markup = '<b>  </b>',
        halign = "center",
        valign = "center",
        widget = wibox.widget.textbox
      },
      bg = date_colors.dark,
      shape = function(cr, w, h)
        return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
      end,
      widget = wibox.container.background,
    },
    bg = date_colors.light,
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, true, false, false, true, 20)
    end,
    widget = wibox.container.background,
  },
  { -- container
    { -- widget
      font = "Iosevka Nerd Font Mono 15",
      widget = wibox.widget.textclock('<b> %a %d-%m-%Y </b>', 43200)
    },
    bg = date_colors.light,
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, false, true, true, false, 20)
    end,
    widget = wibox.container.background,
  },
  widget = wibox.layout.fixed.horizontal
}

date = wibox.widget {
  {
    {
      widget = date_core,
    },
    shape_border_width = 3,
    shape_border_color = date_colors.dark,
    shape = function(cr, w, h)
      return gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20)
    end,
    widget = wibox.container.background,
  },
  widget = wibox.layout.align.horizontal
}
