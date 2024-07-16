local wezterm = require("wezterm")

local mux = wezterm.mux
local act = wezterm.action

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

local process_icons = {
	["docker"] = wezterm.nerdfonts.linux_docker,
	["docker-compose"] = wezterm.nerdfonts.linux_docker,
	["btm"] = "",
	["psql"] = "󱤢",
	["usql"] = "󱤢",
	["kuberlr"] = wezterm.nerdfonts.linux_docker,
	["ssh"] = wezterm.nerdfonts.fa_exchange,
	["ssh-add"] = wezterm.nerdfonts.fa_exchange,
	["kubectl"] = wezterm.nerdfonts.linux_docker,
	["stern"] = wezterm.nerdfonts.linux_docker,
	["nvim"] = wezterm.nerdfonts.custom_neovim,
	["make"] = wezterm.nerdfonts.seti_makefile,
	["vim"] = wezterm.nerdfonts.dev_vim,
	["node"] = wezterm.nerdfonts.mdi_hexagon,
	["go"] = wezterm.nerdfonts.seti_go,
	["python3"] = wezterm.nerdfonts_seti_python,
	["zsh"] = wezterm.nerdfonts.dev_terminal,
	["bash"] = wezterm.nerdfonts.cod_terminal_bash,
	["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["cargo"] = wezterm.nerdfonts.dev_rust,
	["sudo"] = wezterm.nerdfonts.fa_hashtag,
	["lazydocker"] = wezterm.nerdfonts.linux_docker,
	["git"] = wezterm.nerdfonts.dev_git,
	["lua"] = wezterm.nerdfonts.seti_lua,
	["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
	["curl"] = wezterm.nerdfonts.mdi_flattr,
	["gh"] = wezterm.nerdfonts.dev_github_badge,
	["r"] = wezterm.nerdfonts.seti_language_r,
	["ruby"] = wezterm.nerdfonts.cod_ruby,
}

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = "" }
	local HOME_DIR = os.getenv("HOME")

	return current_dir.file_path == HOME_DIR and "~" or string.gsub(current_dir.file_path, "(.*[/\\])(.*)", "%2")
end

local function get_process(tab)
	if not tab.active_pane or tab.active_pane.foreground_process_name == "" then
		return nil
	end

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	-- if string.find(process_name, 'kubectl') then
	--   process_name = 'kubectl'
	-- end

	return process_icons[process_name] or string.format("[%s]", process_name)
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local has_unseen_output = false
	if not tab.is_active then
		for _, pane in ipairs(tab.panes) do
			if pane.has_unseen_output then
				has_unseen_output = true
				break
			end
		end
	end

	local cwd = wezterm.format({
		{ Text = get_current_working_dir(tab) },
	})

	local process = get_process(tab)
	local title = process and string.format(" %s (%s) ", process, cwd) or " [?] "

	if has_unseen_output then
		return {
			{ Foreground = { Color = "#28719c" } },
			{ Text = title },
		}
	end

	return {
		{ Text = title },
	}
end)

return {
	enable_kitty_graphics = true,
	color_scheme = "kanagawabones",
	font = wezterm.font("Maple Mono NF Medium"),
	font_size = 16,
	line_height = 1.1,
	window_decorations = "RESIZE",
	window_padding = { left = 4, right = 4, top = 0, bottom = 0 },
	window_background_opacity = 0.8,
	text_background_opacity = 0.6,
	macos_window_background_blur = 50,
	inactive_pane_hsb = { saturation = 0.8, brightness = 0.8 },
	adjust_window_size_when_changing_font_size = false,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	use_dead_keys = false,
	scrollback_lines = 5000,
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
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "c", mods = "LEADER", action = act.RotatePanes("Clockwise") },
		{ key = "C", mods = "LEADER|SHIFT", action = act.RotatePanes("CounterClockwise") },
		{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
		{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "+", mods = "CMD", action = act.IncreaseFontSize },
		{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
		-- { key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
		-- { key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
		{ key = "b", mods = "LEADER", action = act.SendString("\x02") },
		{ key = " ", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "y", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
		{ key = "p", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
		{ key = ",", mods = "LEADER", action = act.ActivateCommandPalette },
	},
}
