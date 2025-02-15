local wez = require("wezterm")
local act = wez.action

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- local function is_vim(pane)
-- 	-- This gsub is equivalent to POSIX basename(3)
-- 	-- Given "/foo/bar" returns "bar"
-- 	-- Given "c:\\foo\\bar" returns "bar"
-- 	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
-- 	return process_name == "nvim" or process_name == "vim"
-- end

local direction_keys = {
	LeftArrow = "Left",
	DownArrow = "Down",
	UpArrow = "Up",
	RightArrow = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "CTRL|SHIFT" or "SHIFT",
		action = wez.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "CTRL|SHIFT" or "SHIFT" },
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

local config = {}

config.term = "xterm-256color"

config.colors = {
	foreground = "#c3b7ad",
	background = "#1c171d",
	cursor_bg = "#c5ac9d",
	cursor_fg = "#1c171d",
	cursor_border = "#848e92",
	selection_bg = "#cac6b5",
	selection_fg = "#1c171d",
    split = "#49504f",
	ansi = {
		"#222022",
		"#9b6961",
		"#9eada7",
		"#bdb6b0",
		"#848e92",
		"#b299b4",
		"#93bcb7",
		"#c7c4bb",
	},
	brights = {
		"#968e90",
		"#b88e80",
		"#92b8a9",
		"#d3cbba",
		"#cbadbc",
		"#c7abc9",
		"#99b7b3",
		"#c5c2b8",
	},
}

config.scrollback_lines = 50000

config.font = wez.font("Maple Mono NF Medium")

config.font_size = 15.5

config.line_height = 1.0

config.adjust_window_size_when_changing_font_size = false

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_padding = { left = 10, right = 0, top = 0, bottom = 0 }

config.window_background_opacity = 0.9

config.text_background_opacity = 0.9

config.macos_window_background_blur = 25

config.use_dead_keys = false

config.enable_kitty_graphics = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
	{
		key = "r",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wez.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	split_nav("move", "LeftArrow"),
	split_nav("move", "RightArrow"),
	split_nav("move", "UpArrow"),
	split_nav("move", "DownArrow"),
	split_nav("resize", "LeftArrow"),
	split_nav("resize", "RightArrow"),
	split_nav("resize", "UpArrow"),
	split_nav("resize", "DownArrow"),
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "c", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	{ key = "C", mods = "LEADER|SHIFT", action = act.RotatePanes("CounterClockwise") },
	{ key = "+", mods = "CMD", action = act.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
	{ key = "b", mods = "LEADER", action = act.SendString("\x02") },
	{ key = "y", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "Y", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "P", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = ",", mods = "LEADER", action = act.ActivateCommandPalette },
}

return config
