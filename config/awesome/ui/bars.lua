local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- WIDGETS --
local time = wibox.widget {
  widget = wibox.container.background,
  bg = beautiful.bg_alt,
  fg = beautiful.fg,
  {
    widget = wibox.container.margin,
    margins = {top = dpi(8), bottom = dpi(8)},
    {
      layout = wibox.layout.fixed.vertical,
      spacing = dpi(10),
      {
        widget = wibox.widget.textclock,
        font = beautiful.fontname .. "Bold 12",
        halign = "center",
        format = "%H\n%M"
      }
    }
  }
}

local function ctaglist(s)
	local taglist_widget = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
      awful.button({}, 1, function(t) t:view_only() end)
		},
		layout = {
			spacing = dpi(9),
			layout = wibox.layout.fixed.vertical
		},
		widget_template = {
			id = "background_role",
			widget = wibox.container.background,
			forced_height = dpi(15)
		}
	}

	local taglist = wibox.widget {
		widget = wibox.container.background,
		bg = beautiful.bg,
		{
			widget = wibox.container.margin,
			margins = {
        left = dpi(9), right = dpi(9),
        top = dpi(9), bottom = dpi(9),
      },
			taglist_widget
		}
	}
	return taglist
end

-- INIT BAR --
local function initbars(s)
  local bars_widgets = wibox.widget {
    layout = wibox.layout.align.vertical,
    nil,
    {
      widget = wibox.container.margin,
      margins = dpi(4),
      {
        layout = wibox.layout.fixed.vertical,
        spacing = dpi(4),
        ctaglist(s),
      }
    },
    {
      widget = wibox.container.margin,
      margins = dpi(4),
      {
        layout = wibox.layout.fixed.vertical,
        spacing = dpi(4),
        time,
      }
    }
  }

  local bars = awful.wibar {
    position = "left",
    screen = s,
    width = dpi(50),
    bg = beautiful.clean,
    widget = {
      widget = wibox.container.background,
      bg = beautiful.clean,
      {
        widget = wibox.container.margin,
        margins = {left = dpi(4), right = dpi(4)},
        {
          widget = wibox.container.background,
          bg = beautiful.clean,
          bars_widgets,
        }
      }
    }
  }
  return bars
end
awful.screen.connect_for_each_screen(function(s)
	initbars(s)
end)
