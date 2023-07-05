local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

require("widgets")
require("core.utils")

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


-- {{{ Wibar
screen.connect_signal(
  "request::desktop_decoration",
  function(s)
    -- Each screen has its own tag table.
    awful.tag(
      { "", "", "", "", "龎", "󰚢", "", "煉", "" },
      s,
      awful.layout.layouts[1]
    )

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    s.layoutbox = get_layout_indicator(s)

    s.taglist = get_taglist(s)

    s.tasklist = get_tasklist(s)

    -- main bar
    -- Create the wibox
    s.mywibox = awful.wibar {
      widget = {
        { -- Left widgets
          {
            -- mylauncher,
            app_launcher,
            s.tasklist,
            s.mypromptbox,

            spacing = 10,
            layout = wibox.layout.fixed.horizontal,
          },
          halign = "left",
          layout = wibox.container.place,
        },
        { -- Middle widgets
          {
            s.taglist,
            s.layoutbox,

            layout = wibox.layout.fixed.horizontal,
          },
          halign = "center",
          layout = wibox.container.place,
        },
        { -- Right widgets
          {
            --keyboard_layout,
            time,
            date,
            wibox.widget.systray(),

            spacing = 10,
            layout = wibox.layout.fixed.horizontal,
          },
          halign = "right",
          layout = wibox.container.place,
        },
        layout = wibox.layout.align.horizontal,
      },
      screen = s,
      position = "top",
      height = 35,
      border_width = 0,
      margins = {
        top = beautiful.useless_gap + beautiful.border_width,
        left = beautiful.useless_gap + beautiful.border_width,
        right = beautiful.useless_gap + beautiful.border_width,
      },
      --shape = function(cr, w, h)
        --gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20) -- t-left, t-right, b-right, b-left
      --end,
    }
  end
)
-- }}}
