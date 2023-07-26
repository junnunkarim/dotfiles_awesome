require("visual.colorschemes")

local colors = EVERBLUSH

other_colors = {
  light = colors.white,
  gray = colors.gray,
  dark = colors.black,
  too_dark = colors.black0,

  font = colors.white,
  bg = colors.black,
  border = colors.black,
}

---{{{ Widget Colors
app_launcher_colors = {
  font = other_colors.dark,
  bg = colors.red1,
  border = colors.red2,
}

battery_colors = {
  fg = other_colors.dark,
  bg = colors.blue1,
  bg_icon = colors.blue2,
  border = colors.blue2,
}

time_colors = {
  fg = other_colors.dark,
  bg = colors.cyan1,
  bg_icon = colors.cyan2,
  border = colors.cyan2,
}

date_colors = {
  fg = other_colors.dark,
  bg = colors.purple1,
  bg_icon = colors.purple2,
  border = colors.purple2,
}

tray_colors = {
  fg = other_colors.dark,
  bg = colors.black,
  border = colors.black,
}
---}}}

taglist_colors = {
  bg = colors.green1,
  bg_focus = colors.black,
  bg_urgent = colors.black,
  fg = colors.white,
  fg_focus = colors.green1,
  fg_occupied = colors.black,
  fg_urgent = colors.red1,
  border = colors.green2,
  hover = colors.gray,
}

tasklist_colors = {
  fg = colors.black,
  fg_focus = colors.black,
  fg_minimize = colors.black,
  bg = colors.yellow1,
  bg_focus = colors.yellow2,
  bg_minimize = colors.black,
  border = colors.yellow2,
}

titlebar_colors = {
  border = colors.black,
  border_focus = colors.green1,
}

bar_colors = {
  bg = colors.black,
  border = colors.black0,
}
