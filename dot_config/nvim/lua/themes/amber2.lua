local generate_color = require("base46.colors").change_hex_lightness
local mix_color = require("base46.colors").mix

local M = {}
local base16 = {
	base00 = "#141117",
	base01 = "#221f25",
	base02 = "#2b282e",
	base03 = "#49504f",
	base04 = "#837972",
	base05 = "#bfb2aa",
	base06 = "#d3ccb7",
	base07 = "#dfdec9",
	base08 = "#e6beb0",
	base09 = "#a2a8b3",
	base0A = "#bf989c",
	base0B = "#bbb7c0",
	base0C = "#b7a0bd",
	base0D = "#9daba2",
	base0E = "#c2a2b8",
	base0F = "#90a0a0",
}

-- UI
local base30 = {
	white = "#dfc1b6",
	black = "#141117",
	darker_black = "#120f15",
	black2 = "#19151c",
	one_bg = "#221f25",
	one_bg2 = "#28252b",
	one_bg3 = "#2b282e",
	grey = "#312d34",
	grey_fg = "#3b373e",
	grey_fg2 = "#403c43",
	light_grey = "#504c53",
	red = "#b58385",
	baby_pink = "#d6b3bd",
	pink = "#c99aa7",
	line = base16.base03,
	green = "#7db798",
	vibrant_green = "#8cd1ad",
	nord_blue = "#8d9bb3",
	blue = "#657592",
	seablue = "#80a0a4",
	yellow = "#c4aa87",
	sun = "#e3bf94",
	purple = "#c0adda",
	dark_purple = "#aa96c3",
	teal = "#8cbfbc",
	orange = "#dea779",
	cyan = "#9fc7c2",
	statusline_bg = "#322137",
	lightbg = "#6c5c6e",
	pmenu_bg = generate_color(base16.base07, -60),
	folder_bg = "#c9bba9",
}

local polish_hl = {
	defaults = {
		Comment = { fg = base16.base04, italic = true, bold = true },
		Added = { fg = base30.yellow },
		Removed = { fg = base30.baby_pink },
		Changed = { fg = base30.purple },

		WinBar = { bg = generate_color(base16.base03, -18) },
		WinBarNC = { bg = generate_color(base16.base03, -18) },
		WinSeparator = { fg = base30.line },
		Pmenu = { bg = base30.pmenu_bg },
		PmenuSbar = { bg = base30.one_bg },
		PmenuSel = { bg = generate_color(base30.statusline_bg, 3), fg = base30.orange, bold = true },
		PmenuThumb = { bg = base30.grey },
		FloatBorder = { fg = base30.red },
		FloatTitle = { fg = base30.red, bg = base16.base00 },
		NormalFloat = { bg = base16.base00 },
		Title = { fg = base16.base0D, sp = "none" },
		WildMenu = { fg = base16.base08, bg = base16.base0A },

		QuickFixLine = { bg = base16.base01, sp = "none" },
		Question = { fg = base16.base0D },
		Search = { fg = base16.base01, bg = base16.base08 },
		Substitute = { fg = base16.base01, bg = base16.base0A, sp = "none" },
		IncSearch = {
			bg = base30.orange,
			fg = generate_color(base16.base07, -50),
			bold = true,
			italic = true,
			underline = true,
		},
		MatchWord = { link = "IncSearch" },
		MatchParen = { link = "MatchWord" },

		Normal = { fg = base16.base05, bg = base16.base00 },
		Italic = { italic = true },
		Bold = { bold = true },
		UnderLined = { underline = true },
		Conceal = { bg = "NONE" },
		NonText = { fg = base16.base03 },
		DevIconDefault = { fg = base30.red },
		Directory = { fg = base16.base0D },

		ModeMsg = { fg = base16.base0B },
		MoreMsg = { fg = base16.base0B },
		Visual = { bg = base30.purple, fg = base16.base00 },
		VisualNOS = { fg = base16.base09 },
		Macro = { fg = base16.base08 },

		Cursor = { fg = base16.base00, bg = base16.base05 },
		CursorColumn = { bg = base16.base01, sp = "none" },
		CursorLine = { bg = mix_color(generate_color(base30.white, -40), base16.base00, 75) },
		CursorLineNr = { fg = base30.white },
		SignColumn = { fg = base16.base03, sp = "NONE" },
		ColorColumn = { bg = base30.black2 },
		LineNr = { fg = base16.base03 },
		FoldColumn = { bg = "none" },
		Folded = { fg = base30.light_grey, bg = base30.black2 },
		CurSearch = { fg = base30.black2, bg = base30.sun, bold = true },

		Error = { fg = base30.red, bg = base30.statusline_bg },
		ErrorMsg = { fg = base30.red, bg = base30.statusline_bg },
		Exception = { fg = base16.base08 },
		healthSuccess = { bg = base30.green, fg = base30.black },
		Debug = { fg = base16.base08 },
		WarningMsg = { fg = base16.base08 },
		SpecialKey = { fg = base16.base03 },
		TooLong = { fg = base16.base08 },
		NvimInternalError = { fg = base30.red },

		SpellBad = { undercurl = true, sp = base16.base08 },
		SpellLocal = { undercurl = true, sp = base16.base0C },
		SpellCap = { undercurl = true, sp = base16.base0D },
		SpellRare = { undercurl = true, sp = base16.base0E },

		-- Lazy
		LazyH1 = {
			bg = base30.one_bg,
			fg = base30.orange,
			bold = true,
		},
		LazyButton = {
			bg = base30.one_bg,
			fg = generate_color(base30.light_grey, vim.o.bg == "dark" and 25 or -10),
		},
		LazyButtonActive = {
			bg = base30.one_bg,
			-- bg = generate_color(base16.base03, -10),
			fg = base30.orange,
			bold = true,
		},
		LazyH2 = { fg = base30.white, bold = true, italic = true, underline = false },
		LazyReasonPlugin = { fg = base30.red },
		LazyValue = { fg = base30.teal },
		LazyDir = { fg = base16.base05 },
		LazyUrl = { fg = base16.base05 },
		LazyCommit = { fg = base30.green },
		LazyNoCond = { fg = base30.red },
		LazySpecial = { fg = base16.base0B },
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
	},
	neogit = {
		NeogitCommitViewHeader = {
			bg = generate_color(base30.purple, -60),
			fg = base30.white,
		},
		NeogitDiffContext = {
			bg = base16.base00,
			fg = base30.grey,
		},
		NeogitDiffContextHighlight = {
			bg = base30.one_bg2,
			fg = base30.light_grey,
		},
		NeogitDiffContextCursor = {
			bg = generate_color(base30.white, -58),
			fg = base16.base07,
		},
		NeogitHunkHeader = {
			fg = generate_color(base16.base07, -35),
			bg = generate_color(base16.base08, -52),
		},
		NeogitHunkHeaderHighlight = {
			fg = generate_color(base16.base08, -50),
			bg = generate_color(base16.base07, -20),
		},
		NeogitHunkHeaderCursor = {
			fg = generate_color(base16.base08, -45),
			bg = generate_color(base16.base07, -18),
		},
		NeogitDiffAdd = {
			fg = generate_color(base30.green, -10),
			bg = generate_color(base30.green, -44),
		},
		NeogitDiffAddHighlight = {
			fg = base30.green,
			bg = generate_color(base30.green, -40),
		},
		NeogitDiffAddCursor = {
			fg = mix_color(base30.green, "#FFFFFF", 50),
			bg = mix_color(generate_color(base30.white, -58), base30.green, 30),
		},
		NeogitDiffDelete = {
			fg = generate_color(base30.red, -20),
			bg = generate_color(base30.red, -70),
		},
		NeogitDiffDeleteHighlight = {
			fg = generate_color(base30.red, -10),
			bg = generate_color(base30.red, -60),
		},
		NeogitDiffDeleteCursor = {
			fg = mix_color(base30.red, "#FFFFFF", 30),
			bg = mix_color(generate_color(base30.white, -58), base30.red, 10),
		},
	},
	nvimtree = {
		NvimTreeEmptyFolderName = { fg = base30.folder_bg },
		NvimTreeEndOfBuffer = { fg = base30.darker_black },
		NvimTreeFolderIcon = { fg = base30.folder_bg },
		NvimTreeFolderName = { fg = base30.folder_bg },
		NvimTreeFolderArrowOpen = { fg = base30.folder_bg },
		NvimTreeFolderArrowClosed = { fg = base30.grey_fg },
		NvimTreeGitDirty = { fg = base30.red },
		NvimTreeOpenedFolderName = { fg = base30.folder_bg },
		NvimTreeGitIgnored = { fg = base30.light_grey },
		NvimTreeWinSeparator = { fg = base30.lightbg, bg = base30.menu_bg },
		NvimTreeWindowPicker = { fg = base30.red, bg = base30.black2 },
		NvimTreeCursorLine = { bg = base30.black },
		NvimTreeGitNew = { fg = base30.yellow },
		NvimTreeGitDeleted = { fg = base30.red },
		NvimTreeSpecialFile = { fg = base30.yellow, bold = true },
		NvimTreeRootFolder = { fg = base30.red, bold = true },
	},
	arrow = {
		["@ArrowFileIndex"] = { fg = base30.yellow },
		["@ArrowCurrentFile"] = { fg = base30.yellow },
	},

	barbar = {
		["@BufferVisibleNumber"] = { fg = base30.cyan },
		["@BufferVisibleIcon"] = { fg = base30.cyan },
		["@BufferVisibleSign"] = { fg = base30.cyan },
		["@BufferVisibleSignRight"] = { fg = base30.cyan },
	},

	markview = {
		["@markup.heading.1.markdown"] = { fg = generate_color(base16.base03, 20) },
		["@markup.heading.2.markdown"] = { fg = base16.base04 },
		["@markup.heading.3.markdown"] = { fg = base16.base0F },
		["@markup.heading.4.markdown"] = { fg = base16.base08 },
		["@markup.heading.5.markdown"] = { fg = base16.base07 },
		["@markup.heading.6.markdown"] = { fg = base16.base05 },
	},
	treesitter = {
		["@variable"] = { fg = base16.base08 },
		["@variable.r"] = { fg = mix_color(base16.base08, "#DDDDDD", 25) },
		["@variable.member.r"] = { fg = generate_color(base16.base08, -3) },
		["@variable.builtin"] = { fg = generate_color(base16.base09, 5) },
		["@variable.parameter"] = { fg = base16.base08 },
		["@variable.parameter.r"] = { fg = base16.base0E },
		["@variable.member"] = { fg = base16.base08 },
		["@variable.member.key"] = { fg = base16.base08 },

		["@module"] = { fg = base16.base08 },

		["@constant"] = { fg = base16.base08 },
		["@constant.builtin"] = { fg = base16.base09 },
		["@constant.macro"] = { fg = base16.base08 },

		["@string.regex"] = { fg = base16.base0C },
		["@string.escape"] = { fg = base16.base0C },
		["@character"] = { fg = base16.base08 },
		["@number"] = { fg = base16.base09 },
		["@number.float"] = { fg = base16.base09 },

		["@annotation"] = { fg = base16.base0F },
		["@attribute"] = { fg = base16.base0A },
		["@error"] = { fg = base16.base08 },

		["@keyword.exception"] = { fg = base16.base08 },
		["@keyword"] = { fg = base16.base0E },
		["@keyword.function"] = { fg = base16.base09 },
		["@keyword.return"] = { fg = base16.base0E },
		["@keyword.operator"] = { fg = base16.base0E },
		["@keyword.import"] = { link = "Include" },
		["@keyword.conditional"] = { fg = base16.base0E },
		["@keyword.conditional.ternary"] = { fg = base16.base0E },
		["@keyword.repeat"] = { fg = base16.base0A },
		["@keyword.storage"] = { fg = base16.base0A },
		["@keyword.directive.define"] = { fg = base16.base0E },
		["@keyword.directive"] = { fg = base16.base0A },

		["@function"] = { fg = base16.base0D },
		["@function.builtin"] = { fg = base16.base0D },
		["@function.macro"] = { fg = base16.base08 },
		["@function.call"] = { fg = base16.base0D },
		["@function.call.r"] = { fg = base16.base0D },
		["@function.method"] = { fg = base16.base0D },
		["@function.method.call"] = { fg = base16.base0D },
		["@constructor"] = { fg = base16.base0C },

		["@operator"] = { fg = mix_color(base16.base0B, "#FFFFFF", 5) },
		["@operator.r"] = { fg = base16.base0A },
		-- ["@operator.r"] = { fg = base30.purple },
		["@reference"] = { fg = base16.base05 },
		["@punctuation.bracket"] = { fg = mix_color(base16.base07, "#FFFFFF", 5) },
		["@punctuation.delimiter"] = { fg = mix_color(base16.base07, "#FFFFFF", 5) },
		["@punctuation.bracket.r"] = { fg = base16.base0A },
		["@punctuation.delimiter.r"] = { fg = base16.base0A },
		["@symbol"] = { fg = base16.base0B },
		["@tag"] = { fg = base16.base0A },
		["@tag.attribute"] = { fg = base16.base08 },
		["@tag.delimiter"] = { fg = base16.base0F },
		["@text"] = { fg = base16.base05 },
		["@text.emphasis"] = { fg = base16.base09 },
		["@text.strike"] = { fg = base16.base0F, strikethrough = true },
		["@type.builtin"] = { fg = base16.base0A },
		["@definition"] = { sp = base16.base04, underline = true },
		["@scope"] = { bold = true },
		["@property"] = { fg = base16.base08 },

		-- markup
		["@markup.heading"] = { fg = base16.base0D },
		["@markup.raw"] = { fg = base16.base09 },
		["@markup.link"] = { fg = base16.base08 },
		["@markup.link.url"] = { fg = base16.base09, underline = true },
		["@markup.link.label"] = { fg = base16.base0C },
		["@markup.list"] = { fg = base16.base08 },
		["@markup.strong"] = { bold = true },
		["@markup.underline"] = { underline = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.quote"] = { bg = base30.black2 },
		["@comment"] = { fg = base16.base04 },
		["@comment.todo"] = { fg = base30.grey, bg = base30.white },
		["@comment.warning"] = { fg = base30.black2, bg = base16.base09 },
		["@comment.note"] = { fg = base30.black, bg = base30.blue },
		["@comment.danger"] = { fg = base30.black2, bg = base30.red },
		["@diff.plus"] = { fg = base30.green },
		["@diff.minus"] = { fg = base30.red },
		["@diff.delta"] = { fg = base30.light_grey },
		["@NeogitDiffDeleteHighlight"] = { bg = base30.one_bg2, fg = base30.light_grey },
	},
	syntax = {
		Boolean = { fg = base16.base09 },
		Character = { fg = base16.base08 },
		Conditional = { fg = base16.base0E },
		Constant = { fg = base16.base08 },
		Define = { fg = base16.base0E, sp = "none" },
		Delimiter = { fg = base16.base0F },
		Float = { fg = base16.base06 },
		Variable = { fg = base16.base05 },
		Function = { fg = base16.base0D },
		Identifier = { fg = base16.base08, sp = "none" },
		Include = { fg = base16.base0D },
		Keyword = { fg = base16.base0E },
		Label = { fg = base16.base0A },
		Number = { fg = base16.base09 },
		Operator = { fg = base16.base06, sp = "none" },
		PreProc = { fg = base16.base0A },
		Repeat = { fg = base16.base0A },
		Special = { fg = base16.base08 },
		SpecialChar = { fg = base16.base0F },
		Statement = { fg = base16.base08 },
		StorageClass = { fg = base16.base0A },
		String = { fg = base16.base05 },
		Structure = { fg = base16.base0E },
		Tag = { fg = base16.base0A },
		Todo = { fg = base16.base0A, bg = base16.base01 },
		Type = { fg = base16.base0A, sp = "none" },
		Typedef = { fg = base16.base0A },
	},
}

M.base_16 = base16
M.base_30 = base30
M.polish_hl = polish_hl
M.type = "dark"

-- vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = base16.base00 })
-- vim.api.nvim_set_hl(0, "FzfLuaFzfMatch", { bg = base30.grey_fg, fg = base30.purple })
-- vim.api.nvim_set_hl(0, "FzfLuaFzfMarker", { bg = base30.grey_fg, fg = base30.purple })
-- vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "FloatBorder" })
-- vim.api.nvim_set_hl(0, "MiniClueSeparator", { link = "WinSeparator" })
-- -- vim.api.nvim_set_hl(0, "MiniClueDescGroup", { fg = generate_color(base16.base0A, 10) })
-- vim.api.nvim_set_hl(0, "MiniClueDescGroup", { fg = base30.orange })
-- vim.api.nvim_set_hl(0, "MiniClueDescSingle", { fg = generate_color(base16.base04, 25) })
-- vim.api.nvim_set_hl(0, "MiniClueNextKey", { fg = base16.base0A })
-- vim.api.nvim_set_hl(0, "MarkviewCode", { bg = "#1e171c" })

M = require("base46").override_theme(M, "amber2")

return M
