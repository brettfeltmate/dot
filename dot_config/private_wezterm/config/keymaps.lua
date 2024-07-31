local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

return {
	leader = { key = " ", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
		{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "T", mods = "LEADER|SHIFT", action = act.ShowTabNavigator },
		{
			key = "n",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "c", mods = "LEADER", action = act.RotatePanes("Clockwise") },
		{ key = "C", mods = "LEADER|SHIFT", action = act.RotatePanes("CounterClockwise") },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "+", mods = "CMD", action = act.IncreaseFontSize },
		{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
		{ key = "b", mods = "LEADER", action = act.SendString("\x02") },
		{ key = "y", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "Y", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
		{ key = "P", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
		{ key = ",", mods = "LEADER", action = act.ActivateCommandPalette },
		-- Attach to muxer
		{
			key = "a",
			mods = "LEADER",
			action = act.AttachDomain("unix"),
		},

		-- Detach from muxer
		{
			key = "d",
			mods = "LEADER",
			action = act.DetachDomain({ DomainName = "unix" }),
		},

		-- Show list of workspaces
		{
			key = "s",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES" }),
		},
		{
			key = "$",
			mods = "LEADER|SHIFT",
			action = act.PromptInputLine({
				description = "Enter new name for session",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						mux.rename_workspace(window:mux_window():get_workspace(), line)
					end
				end),
			}),
		},

		-- Session manager bindings
		{
			key = "S",
			mods = "LEADER|SHIFT",
			action = act({ EmitEvent = "save_session" }),
		},
		{
			key = "L",
			mods = "LEADER|SHIFT",
			action = act({ EmitEvent = "load_session" }),
		},
		{
			key = "R",
			mods = "LEADER|SHIFT",
			action = act({ EmitEvent = "restore_session" }),
		},
	},
}
