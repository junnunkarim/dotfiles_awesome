local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

require("core.utils")

-- Bling library
local available_bling, bling = pcall(require, "custom_modules.bling")
-- }}}

require("visual.options")
require("visual.themes." .. colorscheme_name .. ".widget_colors")


--[[
if available_bling then
  bling.widget.task_preview.enable {
    x = 5,                    -- The x-coord of the popup
    y = 20,                    -- The y-coord of the popup
    height = 250,              -- The height of the popup
    width = 250,               -- The width of the popup
    placement_fn = function(c) -- Place the widget using awful.placement (this overrides x & y)
    awful.placement.top(
      c,
      {
        margins = {
          top = 50
        }
      }
    )
    end,
    widget_structure = {
      {
        {
          {
            id = 'icon_role',
            widget = awful.widget.clienticon, -- The client icon
          },
          {
            id = 'name_role', -- The client name / title
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.flex.horizontal
        },
        widget = wibox.container.margin,
        margins = 5
      },
      {
        id = 'image_role', -- The client preview
        resize = true,
        valign = 'center',
        halign = 'center',
        widget = wibox.widget.imagebox,
      },
      layout = wibox.layout.fixed.vertical
    }
  }
end
]]--

get_tasklist = function (s)
  -- Create a tasklist widget
  tasklist_core = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    style = {
      shape = function(cr, w, h)
        gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20) -- t-left, t-right, b-right, b-left
      end,

      font = "Iosevka Nerd Font Mono 13",
      icon_size = 25,
      bg_normal = tasklist_colors.light,
      fg_normal = other_colors.gray,
      bg_focus = tasklist_colors.dark,
      fg_focus = other_colors.dark,
      --shape_border_color_focus = tasklist_colors.dark,
      --shape_border_width_focus = 2,
      --shape_border_color = tasklist_colors.light,
      --shape_border_width = 3,
    },
    buttons = {
      awful.button(
        { }, 1,
        function (c)
          c:activate {
            context = "tasklist",
            action = "toggle_minimization"
          }
        end
      ),
      awful.button(
        { }, 3,
        function()
          awful.menu.client_list {
            theme = {
              width = 250
            }
          }
        end
      ),
      awful.button(
        { }, 4,
        function()
          awful.client.focus.byidx(-1)
        end
      ),
      awful.button(
        { }, 5,
        function()
          awful.client.focus.byidx(1)
        end
      ),
    },
    --[[
    layout = {
      spacing = 10,
      layout = wibox.layout.flex.horizontal
    },
    ]]--
    layout = {
      spacing_widget = {
        {
          --forced_width = 5,
          forced_height = 20,
          --thickness = 2,
          color = tasklist_colors.dark,
          widget = wibox.widget.separator
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      spacing = 1,
      layout  = wibox.layout.fixed.horizontal
    },
    --[[
    widget_template = {
      {
        {
          {
            id = "text_role",
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.flex.horizontal,
        },
        margins = {
          left = 10,
          right = 10,
        },
        widget = wibox.container.margin
      },
      id = "background_role",
      widget = wibox.container.background,
    },
    ]]--
    widget_template = {
      {
        --wibox.widget.base.make_widget(),
        forced_height = 8,
        id = 'background_role',
        widget = wibox.container.background,
      },
      {
        {
          id = 'clienticon',
          widget = awful.widget.clienticon,
        },
        margins = {
          left = 10,
          right = 10,
          bottom = 5,
          top = 2,
        },
        widget  = wibox.container.margin
      },
      --[[
      nil,
      if available_bling
        create_callback = function(self, c, index, objects) --luacheck: no unused args
          self:get_children_by_id('clienticon')[1].client = c

          -- BLING: Toggle the popup on hover and disable it off hover
          self:connect_signal('mouse::enter', function()
              awesome.emit_signal("bling::task_preview::visibility", s, true, c)
            end)
            self:connect_signal('mouse::leave', function()
              awesome.emit_signal("bling::task_preview::visibility", s, false, c)
            end)
        end,
      end
      ]]--
      layout = wibox.layout.fixed.vertical,
    },
  }

  tasklist = wibox.widget {
    {
      {
        {
          {
            widget = tasklist_core,
          },
          halign = "center",
          layout = wibox.container.place
        },
        shape = function(cr, w, h)
          gears.shape.partially_rounded_rect(cr, w, h, true, true, true, true, 20) -- t-left, t-right, b-right, b-left
        end,
        bg = tasklist_colors.light,
        shape_border_width = 3,
        shape_border_color = tasklist_colors.dark,
        widget = wibox.container.background,
      },
      strategy = "min",
      width = 200,
      --forced_height = 30,
      widget = wibox.container.constraint,
    },
    strategy = "max",
    width = 500,
    widget = wibox.container.constraint,
  }

  return tasklist
end
