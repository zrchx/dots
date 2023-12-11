local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local user = require("user")

local wall = user.wall(user.snow)

screen.connect_signal("request::wallpaper", function (s)
  awful.wallpaper {
    screen = s,
    widget = {
      image = wall.."Snow-0.png",
      horizontal_fit_policy = "fit",
      vertical_fit_policy = "fit",
      widget = wibox.widget.imagebox,
    }
  }
end)
