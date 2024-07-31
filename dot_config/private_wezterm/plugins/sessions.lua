local wezterm = require("wezterm")

local session = require("plugins/wezterm-session-manager/session-manager")

wezterm.on("save_session", function(window)
	session.save_state(window)
	wezterm.log_info("Session saved")
end)
wezterm.on("load_session", function(window)
	session.load_session(window)
	wezterm.log_info("Session loaded")
end)
wezterm.on("restore_session", function(window)
	session.restore_state(window)
	wezterm.log_info("Session restored")
end)
