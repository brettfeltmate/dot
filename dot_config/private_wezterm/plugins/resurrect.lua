local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
resurrect.init_directories() -- you can delete this line once the directories have been created

local workspace_state = require(resurrect.get_require_path() .. ".plugin.resurrect.workspace_state")

local keys = {
	{
		key = "s",
		mods = "ALT",
		action = wezterm.action.Multiple({
			wezterm.action_callback(function(win, pane)
				resurrect.save_state(workspace_state.get_workspace_state())
			end),
		}),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.Multiple({
			wezterm.action_callback(function(win, pane)
				resurrect.fuzzy_load(win, pane, function(id, label)
					id = string.match(id, "([^/]+)$")
					id = string.match(id, "(.+)%..+$")
					local state = resurrect.load_state(id, "workspace")
					workspace_state.restore_workspace(state, {
						relative = true,
						restore_text = true,
						on_pane_restore = (require(resurrect.get_require_path() .. ".plugin.resurrect.tab_state")).default_on_pane_restore,
					})
				end)
			end),
		}),
	},
}

return keys
