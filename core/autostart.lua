local awful = require("awful")


local function autostart_programs()
  --awful.spawn.with_shell("exec /usr/bin/awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr")
  awful.spawn.single_instance("setxkbmap -option caps:escape")
  awful.spawn.single_instance("setxkbmap -model pc105 -layout us,us -variant dvorak, -option grp:shifts_toggle,grp_led:caps")
  --awful.spawn.single_instance("polkit-gnome-authentication-agent-1")
  awful.spawn.single_instance("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  --awful.spawn.single_instance("xfce4-power-manager")
  awful.spawn.single_instance("picom")
  awful.spawn.single_instance("greenclip daemon")
end

autostart_programs()
