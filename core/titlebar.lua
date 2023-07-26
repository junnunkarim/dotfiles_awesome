local awful = require("awful")
local wibox = require("wibox")

require("visual.options")
require("visual.themes." .. THEME_COLORSCHEME .. ".colors")


-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
  "request::titlebars",
  function(c)
    -- buttons for the titlebar
    local buttons = {
      awful.button(
        { }, 1,
        function()
          c:activate {
            context = "titlebar",
            action = "mouse_move"
          }
        end
      ),
      awful.button(
        { }, 3,
        function()
          c:activate {
            context = "titlebar",
            action = "mouse_resize"
          }
        end
      ),
    }

    local left_titlebar = awful.titlebar(
      c,
      {
        size = 5,
        position = "left",
        bg_normal = titlebar_colors.border,
        bg_focus = titlebar_colors.border_focus,
      }
    )
    left_titlebar : setup {
      { -- Left
        --awful.titlebar.widget.closebutton(c),
        --awful.titlebar.widget.minimizebutton(c),
        --awful.titlebar.widget.maximizedbutton(c),
        --awful.titlebar.widget.floatingbutton(c),
        --awful.titlebar.widget.stickybutton(c),
        --awful.titlebar.widget.ontopbutton(c),
        layout  = wibox.layout.fixed.vertical,
      },
      { -- Middle
        layout  = wibox.layout.fixed.vertical,
      },
      { -- Right
        --{ -- Title
          --align  = "center",
          --widget = awful.titlebar.widget.iconwidget(c)
        --},
        buttons = buttons,
        layout  = wibox.layout.flex.vertical,
        --direction = "east",
        --widget = wibox.container.rotate,
      },
      layout = wibox.layout.align.vertical
    }
  end
)

-- }}}
