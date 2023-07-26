require("visual.colorschemes")

local colors = GRUVBOX

other_colors = {
  light = colors.white,
  gray = colors.gray1,
  dark = colors.black,
  too_dark = colors.black0,

  font = colors.white,
  bg = colors.black,
  border = colors.black,
}

---{{{ Widget Colors
app_launcher_colors = {
  font = other_colors.dark,
  bg = colors.red2,
  border = colors.red1,
}

battery_colors = {
  fg = colors.black,
  bg = colors.green2,
  bg_icon = colors.green1,
  border = colors.green1,
}

time_colors = {
  fg = other_colors.dark,
  bg = colors.aqua2,
  bg_icon = colors.aqua1,
  border = colors.aqua1,
}

date_colors = {
  fg = other_colors.dark,
  bg = colors.purple2,
  bg_icon = colors.purple1,
  border = colors.purple1,
}

tray_colors = {
  fg = other_colors.dark,
  bg = colors.red2,
  border = colors.red1,
}
---}}}

taglist_colors = {
  fg = colors.white,
  bg = colors.blue2,
  bg_focus = colors.blue1,
  bg_urgent = colors.black,
  fg_focus = colors.black,
  fg_occupied = colors.black,
  fg_urgent = colors.red1,
  border = colors.blue1,
  hover = colors.gray2,
}

tasklist_colors = {
  fg = other_colors.dark,
  fg_focus = colors.black,
  fg_minimize = colors.black,
  bg = colors.orange2,
  bg_focus = colors.orange1,
  bg_minimize = colors.black,
  border = colors.orange1,
}

titlebar_colors = {
  border = colors.black,
  border_focus = colors.blue2,
}

bar_colors = {
  bg = colors.black0,
  border = colors.black0,
}
