local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local keys = {
	{
		key = "s",
		mods = "ALT",
		action = workspace_switcher.switch_workspace(),
	},
}

return keys
