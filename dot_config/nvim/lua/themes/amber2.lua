local shade = require("base46.colors").change_hex_lightness
local mix = require("base46.colors").mix

local M = {}
local base16 = {
	base00 = "#151016",
	base01 = "#2b2b1a",
	base02 = "#503f43",
	base03 = "#968e90",
	base04 = "#b6aa9e",
	base05 = "#c5c2b8",
	base06 = "#18161b",
	base07 = "#b4b1b3",
	base08 = "#c4aeab",
	base09 = "#abb4b3",
	base0A = "#cbadbc",
	base0B = "#d3cbba",
	base0C = "#b88e80",
	base0D = "#a4aeaa",
	base0E = "#d19daa",
	base0F = "#88b0ab",
}

-- UI
local base30 = {
	white = shade(base16.base07, 10),
	black = base16.base00, -- usually your theme bg
	darker_black = shade(base16.base00, -6), -- 6% darker than black
	black2 = shade(base16.base00, 5), -- 6% lighter than black
	one_bg = shade(base16.base00, 10), -- 10% lighter than black
	one_bg2 = shade(base16.base00, 15), -- 6% lighter than one_bg2
	one_bg3 = shade(base16.base00, 20), -- 6% lighter than one_bg3
	grey = shade(base16.base00, 40), -- 40% lighter than black (the % here depends so choose the perfect grey!)
	grey_fg = shade(base16.base00, 50), -- 10% lighter than grey
	grey_fg2 = shade(base16.base00, 55), -- 5% lighter than grey
	light_grey = base16.base07,
	red = base16.base0E,
	baby_pink = shade(base16.base0A, 5),
	pink = base16.base0A,
	line = shade(base16.base00, 15), -- 15% lighter than black
	green = base16.base0D,
	vibrant_green = shade(base16.base0D, 10),
	nord_blue = "#a8b1c6",
	blue = "#a1b1ce",
	seablue = "#a1bfe5",
	yellow = base16.base0B, -- 8% lighter than yellow
	sun = "#dcab9d",
	purple = "#99859b",
	dark_purple = "#503f52",
	teal = base16.base0F,
	orange = "#dc9684",
	cyan = "#88bdab",
	statusline_bg = base16.base02,
	lightbg = base16.base07,
	pmenu_bg = base16.base01,
	folder_bg = base16.base03,
}

local polish_hl = {
	defaults = {
		Comment = { fg = base16.base04, italic = true, bold = true },
		Added = { fg = base30.yellow },
		Removed = { fg = base30.baby_pink },
		Changed = { fg = base30.purple },

		WinBar = { bg = shade(base16.base03, -18) },
		WinBarNC = { bg = shade(base16.base03, -18) },
		WinSeparator = { fg = base30.line },
		Pmenu = { bg = base30.pmenu_bg },
		PmenuSbar = { bg = base30.one_bg },
		PmenuSel = { bg = shade(base30.statusline_bg, 3), fg = base30.orange, bold = true },
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
			fg = shade(base16.base07, -50),
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
		CursorLine = { bg = mix(shade(base30.white, -40), base16.base00, 75) },
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
			fg = shade(base30.light_grey, vim.o.bg == "dark" and 25 or -10),
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
			bg = shade(base30.purple, -60),
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
			bg = shade(base30.white, -58),
			fg = base16.base07,
		},
		NeogitHunkHeader = {
			fg = shade(base16.base07, -35),
			bg = shade(base16.base08, -52),
		},
		NeogitHunkHeaderHighlight = {
			fg = shade(base16.base08, -50),
			bg = shade(base16.base07, -20),
		},
		NeogitHunkHeaderCursor = {
			fg = shade(base16.base08, -45),
			bg = shade(base16.base07, -18),
		},
		NeogitDiffAdd = {
			fg = shade(base30.green, -10),
			bg = shade(base30.green, -44),
		},
		NeogitDiffAddHighlight = {
			fg = base30.green,
			bg = shade(base30.green, -40),
		},
		NeogitDiffAddCursor = {
			fg = mix(base30.green, "#FFFFFF", 50),
			bg = mix(shade(base30.white, -58), base30.green, 30),
		},
		NeogitDiffDelete = {
			fg = shade(base30.red, -20),
			bg = shade(base30.red, -70),
		},
		NeogitDiffDeleteHighlight = {
			fg = shade(base30.red, -10),
			bg = shade(base30.red, -60),
		},
		NeogitDiffDeleteCursor = {
			fg = mix(base30.red, "#FFFFFF", 30),
			bg = mix(shade(base30.white, -58), base30.red, 10),
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
		["@markup.heading.1.markdown"] = { fg = shade(base16.base03, 20) },
		["@markup.heading.2.markdown"] = { fg = base16.base04 },
		["@markup.heading.3.markdown"] = { fg = base16.base0F },
		["@markup.heading.4.markdown"] = { fg = base16.base08 },
		["@markup.heading.5.markdown"] = { fg = base16.base07 },
		["@markup.heading.6.markdown"] = { fg = base16.base05 },
	},
	treesitter = {
		["@variable"] = { fg = base16.base08 },
		["@variable.r"] = { fg = mix(base16.base08, "#DDDDDD", 25) },
		["@variable.member.r"] = { fg = shade(base16.base08, -3) },
		["@variable.builtin"] = { fg = shade(base16.base09, 5) },
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

		["@operator"] = { fg = mix(base16.base0B, "#FFFFFF", 5) },
		["@operator.r"] = { fg = base16.base0A },
		-- ["@operator.r"] = { fg = base30.purple },
		["@reference"] = { fg = base16.base05 },
		["@punctuation.bracket"] = { fg = mix(base16.base07, "#FFFFFF", 5) },
		["@punctuation.delimiter"] = { fg = mix(base16.base07, "#FFFFFF", 5) },
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
		Boolean = { fg = base16.base0E },
		Character = { fg = base16.base04 },
		Conditional = { fg = base16.base0E },
		Constant = { fg = base16.base09 },
		Define = { fg = base16.base0D, sp = "none" },
		Delimiter = { fg = base16.base05 },
		Float = { fg = base16.base09 },
		Variable = { fg = base16.base08 },
		Function = { fg = base16.base0D },
		Identifier = { fg = base16.base0E, sp = "none" },
		Include = { fg = base16.base0D },
		Keyword = { fg = base16.base0E },
		Label = { fg = base16.base0A },
		Number = { fg = base16.base05 },
		Operator = { fg = base16.base05, sp = "none" },
		PreProc = { fg = base16.base0A },
		Repeat = { fg = base16.base0A },
		Special = { fg = base16.base05 },
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
