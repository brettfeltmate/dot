local wezterm = require("wezterm")

local os = require("os")
local session = require("wezterm-session-manager/session-manager")
local mux = wezterm.mux
local act = wezterm.action

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

local function is_nvim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end
local direction_keys = {
	LeftArrow = "Left",
	DownArrow = "Down",
	UpArrow = "Up",
	RightArrow = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_nvim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

local colours = {
	teal = "#44AA99",
	lilac = "#67587f",
	yellow = "#a19154",
	red = "#882255",
	rose = "#7c516b",
	grey = "#202020",
	blue = "#2b2042",
	green = "#5f6964",
	purple = "#875EF0",
	plack = "#433847",
}

local config = {
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	unix_domains = {
		{ name = "unix" },
	},
	enable_kitty_graphics = true,
	color_scheme_dirs = { "~/.config/wezterm/color_schemes" },
	color_scheme = "Ashes (base16)",
	font = wezterm.font("Maple Mono NF Semibold"),
	font_size = 16,
	line_height = 1.2,
	window_decorations = "RESIZE",
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	window_background_opacity = 0.9,
	text_background_opacity = 0.9,
	adjust_window_size_when_changing_font_size = false,
	hide_tab_bar_if_only_one_tab = true,
	use_dead_keys = false,
	scrollback_lines = 50000,
	leader = { key = " ", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		split_nav("move", "LeftArrow"),
		split_nav("move", "RightArrow"),
		split_nav("move", "UpArrow"),
		split_nav("move", "DownArrow"),
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
			key = "w",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "WORKSPACES" }),
		},
		-- Show launch_menu
		{
			key = "l",
			mods = "LEADER",
			action = act.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }),
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

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config, {
	left_separator = "|>",
	right_separator = "||",
})

return config
