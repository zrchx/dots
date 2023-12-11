local awful = require("awful")
local user = require("user")
require"applets"

awful.keyboard.append_global_keybindings({
	-- launch programms --
	awful.key({ user.mod }, "Return", function() awful.spawn("ns") end),
	awful.key({ user.mod }, "b", function() awful.spawn("brave") end),
	-- volume up/down/mute --
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn.with_shell(user.audio .. "-i 2")
    Update_value_of_volume()
    awesome.emit_signal("open::infobar")
	end),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn.with_shell(user.audio .. "-d 2")
    Update_value_of_volume()
    awesome.emit_signal("open::infobar")
	end),
	-- switching a focus client -- 
	awful.key({ user.mod }, "Tab", function ()
    awful.client.focus.byidx(1)
  end),
  -- Change layout --
  awful.key({ user.mod }, "space", function ()
    awful.layout.inc(1)
  end),
	-- focus to tag --
	awful.key {
		modifiers = { user.mod },
		keygroup = "numrow",
		on_press = function (index)
		local screen = awful.screen.focused()
		local tag = screen.tags[index]
		if tag then
			tag:view_only()
		end
	end},
	-- move focused client to tag --
	awful.key {
		modifiers = { user.mod, user.shift },
		keygroup = "numrow",
		on_press = function (index)
		if client.focus then
			local tag = client.focus.screen.tags[index]
			if tag then
				client.focus:move_to_tag(tag)
			end
		end
	end},
	-- restart wm --
	awful.key({ user.mod, user.shift }, "r", awesome.restart),
	awful.key({ user.mod, user.shift }, "q", awesome.quit),
})

-- mouse binds --
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function (c)
			c:activate { context = "mouse_click" }
		end),
		awful.button({ user.mod }, 1, function (c)
			c:activate { context = "mouse_click", action = "mouse_move"  }
		end),
		awful.button({ user.mod }, 3, function (c)
			c:activate { context = "mouse_click", action = "mouse_resize" }
		end),
	})
end)

-- client binds --
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ user.mod }, "f", function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end),
		awful.key({ user.mod, user.shift }, "space", awful.client.floating.toggle),
		awful.key({ user.mod }, "z", function (c) c:kill() end),
	})
end)
