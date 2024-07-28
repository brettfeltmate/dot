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

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on("update-right-status", function(window, pane)
	-- Each element holds the text for a cell in a "powerline" style << fade
	local cells = {}

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			-- Running on a newer version of wezterm and we have
			-- a URL object here, making this simple!

			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			-- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
			-- which doesn't have the Url object
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")
			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				-- and extract the cwd from the uri, decoding %-encoding
				cwd = cwd_uri:sub(slash):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		-- Remove the domain name portion of the hostname
		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(cells, cwd)
		table.insert(cells, hostname)
	end

	-- I like my date/time in this style: "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M")
	table.insert(cells, date)

	-- An entry for each battery (typically 0 or 1 battery)
	for _, b in ipairs(wezterm.battery_info()) do
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	-- The powerline < symbol
	local LEFT_ARROW = utf8.char(0xe0b3)
	-- The filled in variant of the < symbol
	-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Color palette for the backgrounds of each cell
	local colors = {
		colours.green,
		colours.lilac,
		colours.rose,
		colours.yellow,
		colours.red,
	}

	-- Foreground color for the text across the fade
	local text_fg = colours.grey

	-- The elements to be formatted
	local elements = {}
	-- How many cells have been formatted
	local num_cells = 0

	-- Translate a cell into elements
	function push(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_fg } })
		table.insert(elements, { Background = { Color = colors[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
			-- table.insert(elements, { Text = utf8.char(0xe0b2) })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)
return {
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	unix_domains = {
		{ name = "unix" },
	},
	enable_kitty_graphics = true,
	color_scheme_dirs = { "~/.config/wezterm/color_schemes" },
	color_scheme = "Ashes (base16)",
	font = wezterm.font("Maple Mono NF Medium"),
	font_size = 16,
	line_height = 1.2,
	window_decorations = "RESIZE",
	window_padding = { left = 4, right = 4, top = 0, bottom = 0 },
	window_background_opacity = 0.9,
	macos_window_background_blur = 20,
	text_background_opacity = 0.8,
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
