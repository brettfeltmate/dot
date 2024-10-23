local generate_color = require("base46.colors").change_hex_lightness
local base16 = {
	base00 = "#221d23",
	base01 = "#292429",
	base02 = "#302831",
	base03 = "#49504f",
	base04 = "#837972",
	base05 = "#bfb0a7",
	base06 = "#949b9f",
	base07 = "#afafb6",
	base08 = "#c8a89d",
	base09 = "#808ea5",
	base0A = "#bf8f94",
	base0B = "#bab2aa",
	base0C = "#bf8080",
	base0D = "#8ea592",
	base0E = "#bfaa8c",
	base0F = "#906d93",
}
-- UI
local base30 = {
	white = "#c8a89d",
	black = "#221d23",
	darker_black = "#1f1d1f",
	black2 = "#292429",
	one_bg = "#302831",
	one_bg2 = "#3e333f",
	one_bg3 = "#413542",
	grey = "#504452",
	grey_fg = "#6c5c6e",
	grey_fg2 = "#7a687c",
	light_grey = "#88748a",
	red = "#d57882",
	baby_pink = "#bf8f94",
	pink = "#a4777c",
	line = "#2a3240",
	green = "#607562",
	vibrant_green = "#8ea592",
	nord_blue = "#707d91",
	blue = "#8996ab",
	seablue = "#80a0a4",
	yellow = "#cbae85",
	sun = "#ceb27d",
	purple = "#a68aa9",
	dark_purple = "#906d93",
	teal = "#97bf9d",
	orange = "#e2ae85",
	cyan = "#899e91",
	statusline_bg = "#352d37",
	lightbg = "#6c5c6e",
	pmenu_bg = "#9a6880",
	folder_bg = "#887a65",
}

local M = {
	base46 = {
		theme = "nightlamp",
		transparency = false,
		changed_themes = {
			nightlamp = {
				base_16 = base16,
				base_30 = base30,
			},
			polish_hl = {
				defaults = {
                    -- ${hl, git}
					Comment = { bg = base30.lightbg, italic = true },
					Added = { fg = base30.yellow },
					Removed = { fg = base30.baby_pink },
					Changed = { fg = base30.purple },
                    --

                    -- ${hl, splits & windows}
					WinBar = { bg = "NONE" },
					WinBarNC = { bg = "NONE" },
					WinSeparator = { fg = base30.line },
					Pmenu = { bg = base30.one_bg },
					PmenuSbar = { bg = base30.one_bg },
					PmenuSel = { bg = base30.pmenu_bg, fg = base30.black },
					PmenuThumb = { bg = base30.grey },
					FloatBorder = { fg = base30.cyan },
					FloatTitle = { fg = base30.white, bg = base30.grey },
					NormalFloat = { bg = base30.darker_black },
					Title = { fg = base16.base0D, sp = "none", },
					WildMenu = { fg = base16.base08, bg = base16.base0A, },
                    --

                    -- ${hl, search & replace}
					QuickFixLine = { bg = base16.base01, sp = "none", },
					Question = { fg = base16.base0D, },
					Search = { fg = base16.base01, bg = base16.base0A, },
					Substitute = { fg = base16.base01, bg = base16.base0A, sp = "none", },
					IncSearch = { fg = base16.base01, bg = base16.base09, },
                    MatchWord = { bg = base30.grey_fg, fg = base30.baby_pink, },
					MatchParen = { link = "MatchWord" },
                    --

                    -- ${hl, text}
					Normal = { fg = base16.base05, bg = base16.base00, },
					Italic = { italic = true, },
					Bold = { bold = true },
					UnderLined = { underline = true, },
					Conceal = { bg = "NONE", },
					NonText = { fg = base16.base03, },
					DevIconDefault = { fg = base30.red },
					Directory = { fg = base16.base0D, },
                    --

                    -- ${hl, modes}
					ModeMsg = { fg = base16.base0B, },
					MoreMsg = { fg = base16.base0B, },
					Visual = { bg = base16.base02, },
					VisualNOS = { fg = base16.base08, },
					Macro = { fg = base16.base08, },
                    --

                    -- ${hl, cursor & column}
					Cursor = { fg = base16.base00, bg = base16.base05, },
					CursorColumn = { bg = base16.base01, sp = "none", },
					CursorLine = { bg = base30.one_bg3, },
					CursorLineNr = { fg = base30.white },
					SignColumn = { fg = base16.base03, sp = "NONE", },
					ColorColumn = { bg = base30.black2, },
					LineNr = { fg = base30.grey },
					FoldColumn = { bg = "none" },
					Folded = { fg = base30.light_grey, bg = base30.black2, },
                    --

                    -- ${hl, errors & msg's}
					Error = { fg = base16.base00, bg = base16.base08, },
					ErrorMsg = { fg = base16.base08, bg = base16.base00, },
					Exception = { fg = base16.base08, },
					healthSuccess = { bg = base30.green, fg = base30.black, },
					Debug = { fg = base16.base08 },
					WarningMsg = { fg = base16.base08, },
					SpecialKey = { fg = base16.base03, }, TooLong = { fg = base16.base08, },
					NvimInternalError = { fg = base30.red },
                    --

                    -- ${hl, spell}
					SpellBad = { undercurl = true, sp = base16.base08, },
					SpellLocal = { undercurl = true, sp = base16.base0C, },
					SpellCap = { undercurl = true, sp = base16.base0D, },
					SpellRare = { undercurl = true, sp = base16.base0E, },
                    --

                    -- ${hl, lazy}
					LazyH1 = { bg = base30.green, fg = base30.black, },
					LazyButton = { bg = base30.one_bg, fg = generate_color(base30.light_grey, vim.o.bg == "dark" and 10 or -20), },
					LazyH2 = { fg = base30.red, bold = true, underline = true, },
					LazyReasonPlugin = { fg = base30.red },
					LazyValue = { fg = base30.teal },
					LazyDir = { fg = base16.base05 },
					LazyUrl = { fg = base16.base05 },
					LazyCommit = { fg = base30.green },
					LazyNoCond = { fg = base30.red },
					LazySpecial = { fg = base30.blue },
					LazyReasonFt = { fg = base30.purple },
					LazyOperator = { fg = base30.white },
					LazyReasonKeys = { fg = base30.teal },
					LazyTaskOutput = { fg = base30.white },
					LazyCommitIssue = { fg = base30.pink },
					LazyReasonEvent = { fg = base30.yellow },
					LazyReasonStart = { fg = base30.white },
					LazyReasonRuntime = { fg = base30.nord_blue },
					LazyReasonCmd = { fg = base30.sun },
					LazyReasonSource = { fg = base30.cyan },
					LazyReasonImport = { fg = base30.white },
					LazyProgressDone = { fg = base30.green },
                    --
				},
                -- ${hl, barbar}
				barbar = {
					["@BufferVisibleNumber"] = { fg = base30.cyan },
					["@BufferVisibleIcon"] = { fg = base30.cyan },
					["@BufferVisibleSign"] = { fg = base30.cyan },
					["@BufferVisibleSignRight"] = { fg = base30.cyan },
				},
                --

                -- ${hl, markview}
				markview = {
					["@markup.heading.1.markdown"] = { fg = base30.red },
					["@markup.heading.2.markdown"] = { fg = base30.orange },
					["@markup.heading.3.markdown"] = { fg = base30.yellow },
					["@markup.heading.4.markdown"] = { fg = base30.green },
					["@markup.heading.5.markdown"] = { fg = base30.blue },
					["@markup.heading.6.markdown"] = { fg = base30.purple },
				},
                --

                -- ${hl, treesitter}
				treesitter = {
					["@variable"] = { fg = "#000000" },
				},
                --

                -- ${hl, syntax}
				syntax = {
					Boolean = { fg = base30.base09 },
					Character = { fg = base30.base08 },
					Conditional = { fg = base30.base0E },
					Constant = { fg = base30.base08 },
					Define = { fg = base30.base0E, sp = "none" },
					Delimiter = { fg = base30.base0F },
					Float = { fg = base30.base09 },
					Variable = { fg = base30.base05 },
					Function = { fg = base30.base0D },
					Identifier = { fg = base30.base08, sp = "none" },
					Include = { fg = base30.base0D },
					Keyword = { fg = base30.base0E },
					Label = { fg = base30.base0A },
					Number = { fg = base30.base09 },
					Operator = { fg = base30.base05, sp = "none" },
					PreProc = { fg = base30.base0A },
					Repeat = { fg = base30.base0A },
					Special = { fg = base30.base0C },
					SpecialChar = { fg = base30.base0F },
					Statement = { fg = base30.base08 },
					StorageClass = { fg = base30.base0A },
					String = { fg = base30.base0B },
					Structure = { fg = base30.base0E },
					Tag = { fg = base30.base0A },
					Todo = { fg = base30.base0A, bg = base30.base01 },
					Type = { fg = base30.base0A, sp = "none" },
					Typedef = { fg = base30.base0A },
				},
                --
			},
		},
		integrations = {
			"cmp",
			"devicons",
			"git",
			"lsp",
			"mason",
			"todo",
			"treesitter",
			"markview",
		},
	},
	ui = {
		cmp = {
			icons = true,
			lspkind_text = true,
			style = "default",
		},
		-- TODO: replace with BarBar.
		-- Or figure out sorting by name.
		tabufline = {
			enabled = true,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs" },
		},
		statusline = {
			theme = "minimal",
			separator_style = "round",
		},
	},
	nvdash = {
		load_on_startup = false,
		header = {},
		buttons = {
			{ txt = "󱁾 Browse   ", keys = "󱁐 󰸤 󰯺", cmd = "Oil" },
			{ txt = "󱞋 Find     ", keys = "󱁐 󰰡 󰯺", cmd = "FzfLua files" },
			{ txt = "󰪻 Recent   ", keys = "󱁐 󰰡 󰰕", cmd = "FzfLua oldfiles" },
			{ txt = "󱂀 Config   ", keys = "󱁐 󰰡 󰯱", cmd = "ChezFzf" },
			{ txt = "󰥩 Grep     ", keys = "󱁐 󰰡 󰯽", cmd = "FzfLua live_grep" },
		},
	},
	lsp = { signature = true },
	cheatsheet = {
		theme = "simple",
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
	},
	mason = { cmd = false, pkgs = {} },
	colorify = { enabled = false },
}

return M
