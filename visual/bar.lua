local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")

require("widgets")
require("core.utils")

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


-- {{{ Wibar
screen.connect_signal(
  "request::desktop_decoration",
  function(s)
    -- Each screen has its own tag table.
    --[[
    awful.tag(
      { "", "", "", "", "", "󰚢", "󰸳", "", "󰆩" },
      -- 󰾔
      s,
      awful.layout.layouts[1]
    )
    ]]--

    awful.tag.add("", {
      index = 1,
      screen = s,
      layout = awful.layout.suit.max,
      selected = true,
    })
    awful.tag.add("", {
      index = 2,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })
    awful.tag.add("", {
      index = 3,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })
    awful.tag.add("", {
      index = 4,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })
    awful.tag.add("", {
      index = 5,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })
    awful.tag.add("󰚢", {
      index = 6,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })
    awful.tag.add("󰸳", {
      index = 7,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })
    awful.tag.add("", {
      index = 8,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })
    awful.tag.add("󰆩", {
      index = 9,
      screen = s,
      layout = awful.layout.suit.max,
      --selected = true,
    })


    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    s.layoutbox = get_layout_indicator(s)

    s.taglist = get_taglist(s)

    s.tasklist = get_tasklist(s)

    s.systray = get_systray(s)

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
            separator,

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

            spacing = 10,
            layout = wibox.layout.fixed.horizontal,
          },
          halign = "center",
          layout = wibox.container.place,
        },
        { -- Right widgets
          {
            --keyboard_layout,
            battery,
            time,
            date,
            s.systray,

            spacing = 10,
            layout = wibox.layout.fixed.horizontal,
          },
          halign = "right",
          layout = wibox.container.place,
        },
        layout = wibox.layout.align.horizontal,
      },
      --screen = s,
      --bg = TRANSPARENT,
      bg = GRUVBOX.black,
      position = "top",
      height = 35,
      border_width = 5,
      border_color = GRUVBOX.black,
      margins = {
        top = beautiful.useless_gap + beautiful.border_width,
        left = beautiful.useless_gap + beautiful.border_width,
        right = beautiful.useless_gap + beautiful.border_width,
      },
      shape = function(cr, w, h)
        gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20) -- t-left, t-right, b-right, b-left
      end,
    }
  end
)
-- }}}
