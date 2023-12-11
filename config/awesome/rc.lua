pcall(require, "luarocks.loader")
local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")
local user = require("user")
-- Theme --
beautiful.init(user.configdir.."theme/theme.lua")
-- Rules --
ruled.client.connect_signal("request::rules", function()
-- Global
ruled.client.append_rule {
	id = "global",
	rule = { },
	properties = {
		focus = awful.client.focus.filter,
		raise = true,
		size_hints_honor = false,
		screen = awful.screen.preferred,
		placement = function(c)
			awful.placement.centered(c, c.transient_for)
			awful.placement.no_offscreen(c)
		end,
	}
}
-- user rules
ruled.client.append_rule {
	rule_any = { class = { "brave" } },
	properties = { tag = "1"}
}
end)
-- focus on mouse over
client.connect_signal("mouse::enter", function(c)
  c:activate { context = "mouse_enter", raise = false }
end)
-- Center dialogs over screen
client.connect_signal('request::manage', function(c)
	if c.transient_for then
		awful.placement.centered(c, c.transient_for)
		awful.placement.no_offscreen(c)
	end
end)
-- Tags --
awful.layout.append_default_layouts({
  awful.layout.suit.floating,
  awful.layout.suit.tile,
})
awful.screen.connect_for_each_screen(function (s)
  awful.tag({ "1", "2", "3", "4"}, s, awful.layout.layouts[1])
end)
awful.mouse.snap.edge_enabled = false
-- Autostart
if user.autostart then
  for _, cmd in ipairs(user.autostart) do
    awful.spawn(cmd)
  end
end
-- Configs Files --
require"keys"
-- UI
require"ui"
