local awful = require("awful")


local function autostart_programs()
  awful.spawn.single_instance("polkit-gnome-authentication-agent-1")
  awful.spawn.single_instance("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  awful.spawn.single_instance("xfce4-power-manager")
  awful.spawn.single_instance("picom")
  awful.spawn.single_instance("greenclip daemon")
end

autostart_programs()
