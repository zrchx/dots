local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- infobar --
local bar = wibox.widget {
	widget = wibox.container.margin,
	margins = dpi(20),
	{
		layout = wibox.layout.fixed.horizontal,
		fill_space = true,
		spacing = dpi(8),
		{
			widget = wibox.widget.textbox,
			id = "icon",
			font = beautiful.fontname .. "16",
		},
		{
			widget = wibox.container.background,
			forced_width = dpi(36),
			{
				widget = wibox.widget.textbox,
				id = "text",
				halign = "center"
			},
		},
		{
			widget = wibox.widget.progressbar,
			id = "progressbar",
			max_value = 100,
			forced_width = dpi(380),
			forced_height = dpi(10),
			background_color = beautiful.bg_alt,
			color = beautiful.red,
		},
	}
}

local infobar = awful.popup {
	visible = false,
	ontop = true,
	border_width = beautiful.border_width,
	border_color = beautiful.border_color_normal,
	minimum_height = dpi(60),
	maximum_height = dpi(60),
	minimum_width = dpi(290),
	maximum_width = dpi(290),
	placement = function(d)
		awful.placement.top(d, { margins = dpi(20) + beautiful.border_width * 2 })
	end,
	widget = bar,
}

-- volume --
awesome.connect_signal("signal::volume", function(value, icon)
	bar:get_children_by_id("text")[1].text = value
	bar:get_children_by_id("icon")[1].text = icon
end)

-- function --
local function infobar_hide()
	infobar.visible = false
  infobar_timer:stop()
end

local infobar_timer = gears.timer {
	timeout = 4,
	callback = infobar_hide
}

local function infobar_toggle()
	if not infobar.visible then
		infobar.visible = true
		infobar_timer:start()
	else
		infobar_timer:again()
	end
end

awesome.connect_signal("open::infobar", function()
	infobar_toggle()
end)
