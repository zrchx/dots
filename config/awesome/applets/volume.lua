local awful = require("awful")
local gears = require("gears")
local user = require("user")

local icon = ""

function Update_value_of_volume()
	awful.spawn.easy_async_with_shell(user.audio.."--get-volume-human", function(stdout)
		local value = stdout:match("(%d?%d?%d?)%%")
		local muted = stdout:match("muted")
		value = tonumber(value)
		if muted == "muted" then
			icon = "󰸈"
		elseif value <= 15 then
			icon = "󰕿"
		elseif value <= 45 then
			icon = "󰖀"
		elseif value <= 70 then
			icon = "󰕾"
		end
		awesome.emit_signal("signal::volume", value, icon)
	end)
end

function Update_value_of_capture_muted()
	awful.spawn.easy_async_with_shell(user.audio.."--get-volume-human", function(stdout)
		local value = stdout:match("muted")
		awesome.emit_signal("signal::capture", value)
	end)
end

function UpdateVolumeSignals()
	Update_value_of_volume()
	Update_value_of_capture_muted()
end

gears.timer {
	call_now = true,
	autostart = true,
	timeout = 2,
	callback = UpdateVolumeSignals,
	single_shot = true
}
