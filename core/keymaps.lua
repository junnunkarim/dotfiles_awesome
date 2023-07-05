local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

require("core.utils")
require("core.scratchpads")

-- {{{ Key bindings

-- Layout related keybindings
awful.keyboard.append_global_keybindings (
  {
    awful.key (
      { SUPER, "Shift" }, "j",
      function()
        awful.client.swap.byidx(1)
      end,
      {description = "swap with next client by index", group = "client"}
    ),
    awful.key (
      { SUPER, "Shift" }, "k",
      function()
        awful.client.swap.byidx(-1)
      end,
      {description = "swap with previous client by index", group = "client"}
    ),
    awful.key (
      { SUPER, }, "u",
      awful.client.urgent.jumpto,
      {description = "jump to urgent client", group = "client"}
    ),
    awful.key(
      { SUPER, "Control", "Shift" }, "space",
      function()
        awful.layout.inc(1)
      end,
      {description = "select next", group = "layout"}
    ),
    --awful.key({ SUPER,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
    --          {description = "increase master width factor", group = "layout"}),
    --awful.key({ SUPER,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
    --           {description = "decrease master width factor", group = "layout"}),
    --awful.key({ SUPER, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
    --           {description = "increase the number of master clients", group = "layout"}),
    --awful.key({ SUPER, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
    --          {description = "decrease the number of master clients", group = "layout"}),
    --awful.key({ SUPER, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
    --          {description = "increase the number of columns", group = "layout"}),
    --awful.key({ SUPER, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
    --          {description = "decrease the number of columns", group = "layout"}),
    --awful.key({ SUPER, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
    --          {description = "select previous", group = "layout"}),
  }
)

awful.keyboard.append_global_keybindings (
  {
    awful.key {
      modifiers = { SUPER },
      keygroup = "numrow",
      description = "only view tag",
      group = "tag",
      on_press =
        function (index)
          local screen = awful.screen.focused()
          local tag = screen.tags[index]
          if tag then
            tag:view_only()
          end
        end,
    },
    awful.key {
      modifiers = { SUPER, "Control" },
      keygroup = "numrow",
      description = "toggle tag",
      group = "tag",
      on_press =
        function (index)
          local screen = awful.screen.focused()
          local tag = screen.tags[index]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end,
    },
    awful.key {
      modifiers = { SUPER, "Shift" },
      keygroup = "numrow",
      description = "move focused client to tag",
      group = "tag",
      on_press =
        function (index)
          if client.focus then
            local tag = client.focus.screen.tags[index]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
    },
    awful.key {
      modifiers = { SUPER, "Control", "Shift" },
      keygroup = "numrow",
      description = "toggle focused client on tag",
      group = "tag",
      on_press =
        function (index)
          if client.focus then
            local tag = client.focus.screen.tags[index]
            if tag then
              client.focus:toggle_tag(tag)
            end
          end
        end,
    },
    awful.key {
      modifiers = { SUPER },
      keygroup = "numpad",
      description = "select layout directly",
      group = "layout",
      on_press =
        function (index)
          local t = awful.screen.focused().selected_tag
          if t then
            t.layout = t.layouts[index] or t.layout
          end
        end,
    }
  }
)

client.connect_signal(
  "request::default_mousebindings",
  function()
    awful.mouse.append_client_mousebindings(
      {
        awful.button(
          { }, 1,
          function (c)
            c:activate {
              context = "mouse_click"
            }
          end
        ),
        awful.button(
          { SUPER }, 1,
          function (c)
            c:activate {
              context = "mouse_click",
              action = "mouse_move"
            }
          end
        ),
        awful.button(
          { SUPER }, 3,
          function (c)
            c:activate {
              context = "mouse_click",
              action = "mouse_resize"
            }
          end
        ),
      }
    )
  end
)

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings(
  {
    awful.button(
      { }, 3,
      function()
        mymainmenu:toggle()
      end
    ),
    awful.button(
      { }, 4,
      awful.tag.viewprev
    ),
    awful.button(
      { }, 5,
      awful.tag.viewnext
    ),
  }
)
-- }}}


client.connect_signal(
  "request::default_keybindings",
  function()
    awful.keyboard.append_client_keybindings(
      {
        awful.key(
          { SUPER, }, "f",
          function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
          end,
          {description = "toggle fullscreen", group = "client"}
        ),
        awful.key(
          { SUPER, }, "c",
          function(c)
            c:kill()
          end,
          {description = "close", group = "client"}
        ),
        awful.key(
          { SUPER, }, "space",
          awful.client.floating.toggle,
          {description = "toggle floating", group = "client"}
        ),
        awful.key(
          { SUPER, "Control" }, "Return",
          function(c)
            c:swap(awful.client.getmaster())
          end,
          {description = "move to master", group = "client"}
        ),
        awful.key(
          { SUPER, }, "o",
          function(c)
            c:move_to_screen()
          end,
          {description = "move to screen", group = "client"}
        ),
        awful.key(
          { SUPER, }, "t",
          function(c)
            c.ontop = not c.ontop
          end,
          {description = "toggle keep on top", group = "client"}
        ),
        awful.key(
          { SUPER, }, "i",
          function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
          end ,
          {description = "minimize", group = "client"}
        ),

        awful.key(
          { SUPER, }, "m",
          function(c)
            c.maximized = not c.maximized
            --c.maximized_horizontal = not c.maximized_horizontal
            --c.maximized_vertical   = not c.maximized_vertical
            --c.ontop = not c.ontop
            c:raise()
          end ,
          {description = "(un)maximize", group = "client"}
        ),
        --[[
        awful.key(
          { SUPER, "Control" }, "m",
          function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
          end ,
          {description = "(un)maximize vertically", group = "client"}
        ),
        awful.key(
          { SUPER, "Shift" }, "m",
          function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
          end ,
          {description = "(un)maximize horizontally", group = "client"}
        ),
        ]]--
      }
    )
  end
)

-- System (super / super + shift)
awful.keyboard.append_global_keybindings (
  {
    awful.key(
      { SUPER,}, "Return",
      function()
        awful.spawn(terminal)
      end,
      {description = "Open a terminal", group = "Applications"}
    ),
    awful.key(
      { SUPER, "Shift"}, "Return",
      function()
        scratch_term:toggle()
        --awful.spawn(os.getenv("HOME") .. "/.bin/scratchpad")
      end,
      {description = "Toggle drop-down terminal", group = "Applications"}
    ),
    awful.key(
      { SUPER, "Shift" }, "h",
      function()
        scratch_btop:toggle()
        --awful.spawn(os.getenv("HOME") .. "/.bin/scratchpad")
      end,
      {description="Launch Btop", group="Applications"}
    ),
    awful.key(
      { SUPER, "Shift" }, "BackSpace",
      function()
        scratch_pass:toggle()
        --awful.spawn(os.getenv("HOME") .. "/.bin/scratchpad")
      end,
      {description="Launch KeePassXC", group="Applications"}
    ),

    awful.key(
      { SUPER, }, "b",
      function()
        for s in screen do
          s.mywibox.visible = not s.mywibox.visible
        end
      end,
      {description = "toggle bar", group = "awesome"}
    ),
    --awful.key({ SUPER },            "r",     function () awful.screen.focused().mypromptbox:run() end,
    --          {description = "run prompt", group = "Launcher"}),
    --awful.key({ SUPER }, "d", function() menubar.show() end,
    --          {description = "show the menubar", group = "Launcher"}),

    awful.key(
      { SUPER,}, "d",
      function()
        awful.spawn(os.getenv("HOME") .. "/.bin/rofi_run")
      end,
      {description = "Open application menu", group = "Launcher"}
    ),
    awful.key(
      { SUPER,}, "n",
      function()
        awful.spawn("networkmanager_dmenu")
      end,
      {description = "Open network menu", group = "Launcher"}
    ),
    awful.key(
      { SUPER,}, "x",
      function()
        awful.spawn(os.getenv("HOME") .. "/.bin/powermenu")
      end,
      {description = "Open power menu", group = "Launcher"}
    ),
    awful.key(
      { SUPER,}, "h",
      function()
        awful.spawn(os.getenv("HOME") .. "/.bin/clipboard")
      end,
      {description = "Open clipboard manager", group = "Launcher"}
    ),
    awful.key(
      { SUPER,}, "r",
      function()
        awful.spawn(os.getenv("HOME") .. "/.bin/rofi_calc")
      end,
      {description = "Open calculator ", group = "Launcher"}
    ),

    awful.key(
      { SUPER,}, "l",
      function()
        awful.spawn("slock")
      end,
      {description = "Lock screen", group = "Launcher"}
    ),

    awful.key(
      { SUPER, "Shift" }, "r",
      awesome.restart,
      {description = "Reload awesomewm", group = "Awesome"}
    ),
    awful.key(
      { SUPER, }, "w",
      function()
        mymainmenu:toggle()
      end,
      {description = "Show main-menu", group = "Awesome"}
    ),
    awful.key(
      { SUPER, "Shift" }, "q",
      awesome.quit,
      {description = "Quit awesomewm", group = "Awesome"}
    ),
    awful.key(
      { SUPER,}, "/",
      hotkeys_popup.show_help,
      {description = "Show keybindings", group = "Awesome"}
    ),

    awful.key(
      { SUPER, "Shift" }, "l",
      function()
        awful.prompt.run {
          prompt = "Run Lua code: ",
          textbox = awful.screen.focused().mypromptbox.widget,
          exe_callback = awful.util.eval,
          history_path = awful.util.get_cache_dir() .. "/history_eval"
        }
      end,
      {description = "Lua execute prompt", group = "Awesome"}
    ),
  }
)
-- Tags related keybindings
awful.keyboard.append_global_keybindings (
  {
    --awful.key({ SUPER,           }, "grave",   awful.tag.viewprev,
    --          {description = "View previous", group = "Tag"}),
    --awful.key({ SUPER,           }, "Tab",  awful.tag.viewnext,
    --          {description = "View next", group = "Tag"}),
    awful.key(
      { SUPER, }, "grave",
      function()
      -- tag_view_nonempty(-1)
        local focused = awful.screen.focused()
        while #focused.tags do
          awful.tag.viewidx(-1, focused)
          if #focused.clients > 0 then
            return
          end
        end
      end,
      {description = "Cycle through non-empty tags anti-clockwise", group = "tag"}
    ),
    awful.key(
      { SUPER, }, "Tab",
      function()
      -- tag_view_nonempty(1)
        local focused = awful.screen.focused()
        while focused.tags do
          awful.tag.viewidx(1, focused)
          if #focused.clients > 0 then
            return
          end
        end
      end,
      {description = "Cycle through non-empty tags clockwise", group = "tag"}
    ),
    awful.key(
      { SUPER, }, "Escape",
      awful.tag.history.restore,
      {description = "Go back", group = "Tag"}
    ),
  }
)
-- Focus related keybindings
awful.keyboard.append_global_keybindings (
  {
    awful.key(
      { ALT, }, "Tab",
      function()
        awful.client.focus.byidx( 1)
      end,
      {description = "focus next by index", group = "client"}
    ),
    awful.key(
      { ALT, }, "grave",
      function()
        awful.client.focus.byidx(-1)
      end,
      {description = "focus previous by index", group = "client"}
    ),
    awful.key(
      { ALT, "Shift" }, "Tab",
      function()
        awful.client.focus.history.previous()
        if client.focus then
          client.focus:raise()
        end
      end,
      {description = "go back", group = "client"}
    ),
    --awful.key({ SUPER, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
    --          {description = "focus the next screen", group = "screen"}),
    --awful.key({ SUPER, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    --          {description = "focus the previous screen", group = "screen"}),
    awful.key(
      { SUPER, "Shift" }, "i",
      function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          c:activate { raise = true, context = "key.unminimize" }
        end
      end,
      {description = "restore minimized", group = "client"}
    ),
  }
)


-- Other programs or scripts (super + ctrl)
awful.keyboard.append_global_keybindings (
  {
    awful.key(
      { SUPER, "Control" }, "r",
      function()
        awful.spawn("redshift -P -O 5500")
      end,
      {description="Activate bluelight filter (Day)", group="Applications"}
    ),
    awful.key(
      { SUPER, "Control" }, "v",
      function()
        awful.spawn("redshift -P -O 3500")
      end,
      {description="Activate bluelight filter (Night)", group="Applications"}
    ),
    awful.key(
      { SUPER, "Control" }, "n",
      function()
        awful.spawn("redshift -x")
      end,
      {description="Deactivate bluelight filter", group="Applications"}
    ),

    awful.key(
      { SUPER, "Control" }, "p",
      function()
        awful.spawn("picom")
      end,
      {description="Turn on compositor (picom)", group="Applications"}
    ),
    awful.key(
      { SUPER, "Control" }, "u",
      function()
        awful.spawn("pkill picom")
      end,
      {description="Turn off compositor (picom)", group="Applications"}
    ),

    awful.key(
      { SUPER, "Control" }, "g",
      function()
        awful.spawn("gpick")
      end,
      {description="Open color picker", group="Applications"}
    ),
  }
)

-- Applications (super + alt)
awful.keyboard.append_global_keybindings (
  {
    awful.key(
      { SUPER, ALT }, "b",
      function()
        awful.spawn("chromium")
      end,
      {description="Launch Chromium", group="Applications"}
    ),
    awful.key(
      { SUPER, ALT }, "e",
      function()
        awful.spawn("firefox")
      end,
      {description="Launch Firefox", group="Applications"}
    ),

    awful.key(
      { SUPER, ALT }, "f",
      function()
        awful.spawn("thunar")
      end,
      {description="Launch Thunar", group="Applications"}
    ),

    awful.key(
      { SUPER, ALT }, "v",
      function()
        awful.spawn("alacritty -e nvim")
      end,
      {description="Launch Neovim", group="Applications"}
    ),
    awful.key(
      { SUPER, ALT }, "n",
      function()
        awful.spawn("alacritty -e bash ~/.bin/nnn_run -T v")
      end,
      {description="Launch nnn", group="Applications"}
    ),
  }
)

-- System Keys
awful.keyboard.append_global_keybindings (
  {
    awful.key(
      { }, "Print",
      function()
        awful.spawn("flameshot full -p " .. os.getenv("HOME") .. "/Pictures/SS/")
      end,
      {description="Take Full-screen screenshot", group="System Keys"}
    ),
    awful.key(
      { SUPER }, "Print",
      function()
        awful.spawn("flameshot gui")
      end,
      {description="Open screenshot gui", group="System Keys"}
    ),
    awful.key(
      { ALT }, "Print",
      function()
        awful.spawn("flameshot full -d 5000 -p " .. os.getenv("HOME") .. "/Pictures/SS/")
      end,
      {description="Take full-screen screenshot after 5 seconds", group="System Keys"}
    ),
    awful.key(
      { "Shift" }, "Print",
      function()
        awful.spawn("flameshot full -d 10000 -p " .. os.getenv("HOME") .. "/Pictures/SS/")
      end,
      {description="Take full-screen screenshot after 10 seconds", group="System Keys"}
    ),

    awful.key(
      { }, "XF86MonBrightnessUp",
      function()
        awful.spawn("brightnessctl -d \"intel_backlight\" set +2%")
      end,
      {description="Increase screen brightness", group="System Keys"}
    ),
    awful.key(
      { }, "XF86MonBrightnessDown",
      function()
        awful.spawn("brightnessctl -d \"intel_backlight\" set 2%-")
      end,
      {description="Decrease screen brightness", group="System Keys"}
    ),
    awful.key(
      { SUPER }, "F1",
      function()
        awful.spawn("brightnessctl -d \"intel_backlight\" set 2%-")
      end,
      {description="Decrease screen brightness", group="System Keys"}
    ),
    awful.key(
      { SUPER }, "F2",
      function()
        awful.spawn("brightnessctl -d \"intel_backlight\" set +2%")
      end,
      {description="Increase screen brightness", group="System Keys"}
    ),

    awful.key(
      { }, "XF86AudioRaiseVolume",
      function()
        awful.spawn("pactl set-sink-volume 0 +2%")
      end,
      {description="Increase volume", group="System Keys"}
    ),
    awful.key(
      { }, "XF86AudioLowerVolume",
      function()
        awful.spawn("pactl set-sink-volume 0 -2%")
      end,
      {description="Decrease volume", group="System Keys"}
    ),
    awful.key(
      { }, "XF86AudioMute",
      function()
        awful.spawn("pactl set-sink-mute 0 toggle")
      end,
      {description="Mute volume", group="System Keys"}
    ),
    awful.key(
      { SUPER }, "F5",
      function()
        awful.spawn("pactl set-sink-volume 0 -2%")
      end,
      {description="Decrease volume", group="System Keys"}
    ),
    awful.key(
      { SUPER }, "F6",
      function()
        awful.spawn("pactl set-sink-volume 0 +2%")
      end,
      {description="Increase volume", group="System Keys"}
    ),
    awful.key(
      { SUPER }, "F7",
      function()
        awful.spawn("pactl set-sink-mute 0 toggle")
      end,
      {description = "Mute volume", group = "System Keys"}
    ),

    awful.key(
      { SUPER }, "F9",
      function()
        awful.spawn("nmcli radio all off && notify-send \"Turned off wifi\"")
      end,
      {description = "Turn off wifi", group = "System Keys"}
    ),
    awful.key(
      { SUPER }, "F10",
      function()
        awful.spawn("nmcli radio all on && notify-send \"Turned on wifi\"")
      end,
      {description = "Turn on wifi", group = "System Keys"}
    ),
  }
)
-- }}}
