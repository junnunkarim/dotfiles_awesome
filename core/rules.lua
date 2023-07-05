-- Standard awesome library
local awful = require("awful")
local gears = require("gears")
require("awful.autofocus")
-- Declarative object management
local ruled = require("ruled")


-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal(
  "request::rules",
  function()
    -- All clients will match this rule.
    ruled.client.append_rule {
      id = "global",
      rule = { },
      properties = {
        focus = awful.client.focus.filter,
        raise = true,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen
      },
      callback = awful.client.setslave -- Start windows as slave
    }

    -- Floating clients.
    ruled.client.append_rule {
      id = "floating",
      rule_any = {
        instance = {
          "copyq",
          "pinentry"
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Kruler",
          "Sxiv",
          "Tor Browser",
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
          "Gpick",
          --"Alacritty",
          "wezterm",
          "kitty",
          "Lxappearance",
          "Xfce-polkit",
          "Protonvpn",
        },
        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",    -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
        }
      },
      properties = {
        floating = true
      },
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule
    {
      id = "titlebars",
      rule_any = {
        type = {
          "normal",
          "dialog"
        }
      },
      properties = {
        titlebars_enabled = true
      },
    }

    -- app rules
    ruled.client.append_rule
    {
      rule_any = {
        class = {
          --"org.wezfurlong.wezterm",
          "Alacritty",
          "Emacs",
          "Geany",
          "jetbrains-idea-ce",
          "st-256color",
        }
      },
      properties = {
        tag = "",
        switch_to_tags = true,
        maximized = false,
      }
    }

    ruled.client.append_rule
    {
      rule_any = {
        class = {
          "Pcmanfm",
          "Thunar",
          "qBittorrent",
        }
      },
      properties = {
        tag = "",
        switch_to_tags = true,
        maximized = false,
      }
    }

    ruled.client.append_rule
    {
      rule_any = {
        class = {
          "firefox",
          "Chromium",
          "Vieb",
          "Nyxt",
        }
      },
      properties = {
        tag = "",
        switch_to_tags = true,
        maximized = false,
      }
    }

    ruled.client.append_rule
    {
      rule_any = {
        class = {
          "Gimp",
          "obs",
          "vlc",
          "mpv",
        }
      },
      properties = {
        tag = "",
        switch_to_tags = true,
        maximized = false,
      }
    }

    ruled.client.append_rule
    {
      rule_any = {
        class = {
          "calibre",
          "Zathura",
          "sioyek",
          "DesktopEditors",
        }
      },
      properties = {
        tag = "龎",
        switch_to_tags = true,
        maximized = false,
      }
    }

    ruled.client.append_rule
    {
      rule_any = {
        class = {
          "KotatogramDesktop",
        }
      },
      properties = {
        tag = "󰚢",
        switch_to_tags = true,
        maximized = false,
      }
    }

    ruled.client.append_rule
    {
      rule_any = {
        class = {
          "Ryujinx",
          "yuzu",
          "retroarch",
        }
      },
      properties = {
        tag = "",
        switch_to_tags = true,
        maximized = false,
      }
    }

    ruled.client.append_rule
    {
      rule_any = {
        class = {
          "GParted",
          "Xfce4-power-manager-settings",
        }
      },
      properties = {
        tag = "煉",
        switch_to_tags = true,
        maximized = false,
      }
    }
  end
)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
  "mouse::enter",
  function(c)
    c:activate {
      context = "mouse_enter",
      raise = false,
    }
  end
)
-- }}}
