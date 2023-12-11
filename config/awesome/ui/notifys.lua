local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")
local dpi = beautiful.xresources.apply_dpi

-- notifications --
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification {
		urgency = "critical",
		title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
		message = message,
		icon = beautiful.notification_icon_error,
	}
end)

ruled.notification.connect_signal('request::rules', function()

  ruled.notification.append_rule {
	  rule = { urgency = "normal" },
	  properties = {
		  screen = awful.screen.focused,
		  implicit_timeout = 3,
		  position = "top_middle",
		  spacing = dpi(10),
		  bg = beautiful.bg,
		  fg = beautiful.fg,
		  border_width = beautiful.border_width,
		  border_color = beautiful.border_color_normal,
	  }
  }

  ruled.notification.append_rule {
	  rule = { urgency = "critical" },
	  properties = {
		  screen = awful.screen.focused,
		  implicit_timeout = 7,
		  position = "top_middle",
		  spacing = dpi(10),
		  bg = beautiful.bg,
		  fg = beautiful.fg,
		  border_width = beautiful.border_width,
		  border_color = beautiful.border_color_normal,
		  icon = beautiful.notification_error,
	  }
  }
end)

naughty.connect_signal("request::display", function(n)
	if not n.app_icon then
		n.app_icon = beautiful.notification_icon
	end

  naughty.layout.box {
	  notification = n,
	  maximum_width = dpi(800),
	  maximum_height = dpi(120),
	  widget_template = {
		  widget = wibox.container.constraint,
		  strategy = "max",
		  {
			  widget = naughty.container.background,
			  id = "background_role",
			  {
				  widget = wibox.container.margin,
				  margins = dpi(10),
				  {
					  layout = wibox.layout.fixed.horizontal,
					  spacing = dpi(20),
					  fill_space = true,
					  {
						  widget = wibox.container.margin,
						  margins = { bottom = dpi(10), top = dpi(10) },
						  {
							  widget = wibox.container.background,
							  shape = gears.shape.circle,
							  naughty.widget.icon,
						  },
					  },
					  {
						  layout = wibox.layout.fixed.vertical,
						  spacing = dpi(10),
						  naughty.widget.title,
						  naughty.widget.message,
					  }
				  }
			  }
		  }
	  }
  }
end)
