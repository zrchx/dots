-- Copy me if you can
local home = os.getenv("HOME")
local M = {}
-- Directorys --
M.home = home
M.configdir = home.."/DevOps/Dotfiles/config/awesome/"
-- Keys --
M.mod = "Mod4"
M.shift = "Shift"
M.ctrl = "Control"
-- Preferences --
M.terminal = "ns"
M.browser = "brave"
M.audio = "pamixer "
M.media = "playerctl "
-- Screnshots --
local ssdir = " ~/Media/Screenshots/$(date +%s).png "
M.ssmanager = "maim"..ssdir.."-q -b 2 -p 4 "
-- Theme --
M.snow = "Snow"
M.waves = "Waves"
M.minimal = "minimal"
M.colors = function (style)
  if style == "Snow" then
    local colors = {}
    return colors
  elseif style == "Waves" then
    local colors = {}
      colors.bg = "#191919"
      colors.bg_alt = "#262626"
      colors.bg_urgent = "#393939"
      colors.fg_alt = "#4c4c4c"
      colors.fg = "#f0f0f0"

      colors.green = "#9ec49f"
      colors.yellow = "#c4c19e"
      colors.blue = "#a5b4cb"
      colors.red = "#c49ea0"
      colors.orange = "#ceb188"
      colors.violet = "#c49ec4"
      colors.cyan = "#9ec3c4"

      colors.clean = "#00000000"
      colors.accent = colors.blue
    return colors
  elseif style == "minimal" then
    local colors = {}
    return colors
  end
end
-- Wallpaper
M.wall = function (style)
  if style == "Snow" then
    return M.configdir.."/theme/Snow/"
  elseif style == "Waves" then
    return M.configdir.."theme/Waves/"
  elseif style == "minimal" then
  end
end
-- Autostart
M.autostart = {
  "picom"
}
return M
