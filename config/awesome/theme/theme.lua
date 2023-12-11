local user = require("user")
local beautiful = require("beautiful")

local colors = user.colors(user.waves)
local dpi = beautiful.xresources.apply_dpi

local theme = {}
-- Fonts
theme.font = "JetBrainsMonoNL Nerd Font 10"
theme.fontname = "JetBrainsMonoNL Nerd Font "

-- colors --
theme.bg = colors.bg
theme.bg_alt = colors.bg_alt
theme.bg_urgent = colors.bg_urgent
theme.fg_alt = colors.fg_alt
theme.fg = colors.fg

theme.green = colors.green
theme.yellow = colors.yellow
theme.blue = colors.blue
theme.red = colors.red
theme.orange = colors.orange
theme.violet = colors.violet

theme.clean = colors.clean
theme.accent = colors.accent

-- borders --
theme.useless_gap = dpi(12)
theme.border_width = dpi(2)
theme.border_color_normal = theme.bg_urgent
theme.border_color_active = theme.bg_urgent

-- menus --
theme.menu_bg_normal = theme.bg
theme.menu_fg_normal = theme.fg
theme.menu_bg_focus = theme.accent
theme.menu_fg_focus = theme.bg
theme.menu_width = dpi(120)
theme.menu_height = dpi(25)
theme.menu_boder_width = theme.border_width
theme.menu_boder_color = theme.border_color_normal
theme.menu_submenu = ">"

-- Taglist --
theme.taglist_bg_focus = theme.accent
theme.taglist_bg_urgent = theme.red
theme.taglist_bg_occupied = theme.bg_urgent
theme.taglist_bg_empty = theme.bg_alt

theme.progressbar_fg = theme.accent

-- notification --
theme.notification_spacing = dpi(theme.useless_gap * 3)
return theme
