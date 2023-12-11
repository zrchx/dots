local awful = require("awful")
local beautiful = require("beautiful")
local user = require("user")
require"applets"

local powermenu = {
  {"Poweroff", function ()
    awful.spawn.with_shell("loginctl poweroff")
  end},
  {"Reboot", function ()
    awful.spawn.with_shell("reboot")
  end}
}
local wmmenu = {
  {"Quit", function ()
    awesome.quit()
  end},
  {"Reload", function ()
    awesome.restart()
  end}
}
local launcher = {
  {"Terminal", function ()
    awful.spawn.with_shell(user.terminal)
  end},
  {"Browser", function ()
    awful.spawn.with_shell(user.browser)
  end}
}

local volume = {
  {"Mute/Unmute", function ()
    awful.spawn.with_shell(user.audio.."-t")
    Update_value_of_volume()
    awesome.emit_signal("open::infobar")
  end},
  {"Play/Pause", function ()
    awful.spawn.with_shell(user.media.."play-pause")
  end},
  {"Next", function ()
    awful.spawn.with_shell(user.media.."next")
  end},
  {"Prev", function ()
    awful.spawn.with_shell(user.media.."previous")
  end}
}

local ss = {
  {"Now", function ()
    awful.spawn.with_shell(user.ssmanager.."-u")
  end},
  {"5 Sec", function ()
    awful.spawn.with_shell(user.ssmanager.."-d 3")
  end},
  {"SelWin", function ()
    awful.spawn.with_shell(user.ssmanager.."-s")
  end}
}

local control = {
  {"Shots", ss},
  {"Media", volume}
}

local mainmenu = awful.menu({
  items = {
    {"Apps", launcher, beautiful.apps_icon},
    {"Controls", control, beautiful.controls_icon },
    {"Awesome", wmmenu, beautiful.awesome_icon},
    {"PowerMenu", powermenu, beautiful.power_icon}
  }
})
-- callback
awful.mouse.append_global_mousebindings({
  awful.button({}, 3, function ()
    mainmenu:toggle()
  end)
})
