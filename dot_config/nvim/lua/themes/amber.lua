local generate_color = require("base46.colors").change_hex_lightness

local M = {}
local base16 = {
	base00 = "#1c171d",
	base01 = "#1f1a1f",
	base02 = "#211922",
	base03 = "#49504f",
	base04 = "#837972",
	base05 = "#c5b8b0",
	base06 = "#949b9f",
	base07 = "#afafb6",
	base08 = "#c8a89d",
	base09 = "#8a909b",
	base0A = "#bf8f94",
	base0B = "#c0baa9",
	base0C = "#bf8080",
	base0D = "#9fbfaa",
	base0E = "#bfaa8c",
	base0F = "#b195b3",
}
-- UI
local base30 = {
	white = "#c8a89d",
	black = "#231e23",
	darker_black = "#211c22",
	black2 = "#241f24",
	one_bg = "#211c22",
	one_bg2 = "#241f24",
	one_bg3 = "#261e27",
	grey = "#423343",
	grey_fg = "#473648",
	grey_fg2 = "#4d3c4f",
	light_grey = "#655667",
	red = "#d1969c",
	baby_pink = "#bf8f94",
	pink = "#a4777c",
	line = base16.base03,
	green = "#66987c",
	vibrant_green = "#8ea592",
	nord_blue = "#707d91",
	blue = "#8996ab",
	seablue = "#80a0a4",
	yellow = "#cbae85",
	sun = "#ceb27d",
	purple = "#c0adda",
	dark_purple = "#ad93cd",
	teal = "#97bf9d",
	orange = "#dcb08d",
	cyan = "#6ac1aa",
	statusline_bg = "#352d37",
	lightbg = "#6c5c6e",
	pmenu_bg = generate_color(base16.base07, -60),
	folder_bg = "#c9bba9",
}

local polish_hl = {
	defaults = {
		Comment = { fg = base30.light_grey, italic = true, bold = true },
		Added = { fg = base30.yellow },
		Removed = { fg = base30.baby_pink },
		Changed = { fg = base30.purple },

		WinBar = { bg = "NONE" },
		WinBarNC = { bg = "NONE" },
		WinSeparator = { fg = base30.line },
		Pmenu = { bg = base30.pmenu_bg },
		PmenuSbar = { bg = base30.one_bg },
		PmenuSel = { bg = base30.statusline_bg, fg = base30.purple },
		PmenuThumb = { bg = base30.grey },
		FloatBorder = { fg = base30.cyan },
		FloatTitle = { fg = base30.white, bg = base30.grey },
		NormalFloat = { bg = base30.darker_black },
		Title = { fg = base16.base0D, sp = "none" },
		WildMenu = { fg = base16.base08, bg = base16.base0A },

		QuickFixLine = { bg = base16.base01, sp = "none" },
		Question = { fg = base16.base0D },
		Search = { fg = base16.base01, bg = base16.base08 },
		Substitute = { fg = base16.base01, bg = base16.base0A, sp = "none" },
		IncSearch = { fg = base16.base01, bg = base16.base09 },
		MatchWord = { bg = base30.grey_fg, fg = base30.baby_pink },
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
		Visual = { bg = base16.base02 },
		VisualNOS = { fg = base16.base08 },
		Macro = { fg = base16.base08 },

		Cursor = { fg = base16.base00, bg = base16.base05 },
		CursorColumn = { bg = base16.base01, sp = "none" },
		CursorLine = { bg = generate_color(base30.line, -20) },
		CursorLineNr = { fg = base30.white },
		SignColumn = { fg = base16.base03, sp = "NONE" },
		ColorColumn = { bg = base30.black2 },
		LineNr = { fg = base16.base03 },
		FoldColumn = { bg = "none" },
		Folded = { fg = base30.light_grey, bg = base30.black2 },
		CurSearch = { fg = base30.black2, bg = base30.sun, bold = true },

		Error = { fg = base16.base00, bg = base16.base08 },
		ErrorMsg = { fg = base16.base08, bg = base16.base00 },
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
			bg = generate_color(base16.base03, -10),
			fg = base30.white,
		},
		LazyButton = {
			bg = base30.one_bg,
			fg = generate_color(base30.light_grey, vim.o.bg == "dark" and 10 or -20),
		},
		LazyButtonActive = {
			bg = generate_color(base16.base03, -10),
			fg = base30.white,
			bold = true,
		},
		LazyH2 = { fg = base30.blue, bold = true, italic = false },
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
	},
	neogit = {
		NeogitHunkHeader= {
            fg = generate_color(base16.base08, -45),
			bg = generate_color(base16.base07, -55),
		},
		NeogitHunkHeaderHighlight = {
            fg = generate_color(base16.base08, -10),
			bg = generate_color(base16.base07, -50),
		},
		NeogitHunkHeaderCursor = {
            fg = generate_color(base16.base08, -5),
			bg = generate_color(base16.base07, -45),
		},
		NeogitDiffAdd = {
			fg = generate_color(base30.green, 5),
			bg = generate_color(base30.green, -45),
		},
		NeogitDiffAddHighlight = {
			fg = generate_color(base30.green, 5),
			bg = generate_color(base30.green, -42),
		},
		NeogitDiffAddCursor = {
			fg = generate_color(base30.green, 10),
			bg = generate_color(base30.green, -40),
		},
        NeogitDiffDelete = {
            fg = base30.red,
            bg = generate_color(base30.red, -62),
        },
        NeogitDiffDeleteHighlight = {
            fg = base30.red,
            bg = generate_color(base30.red, -57),
        },
        NeogitDiffDeleteCursor = {
            fg = generate_color(base30.red, 5),
            bg = generate_color(base30.red, -55),
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

		NvimTreeWinSeparator = {
			fg = base30.lightbg,
			bg = base30.menu_bg,
		},

		NvimTreeWindowPicker = {
			fg = base30.red,
			bg = base30.black2,
		},

		NvimTreeCursorLine = {
			bg = base30.black,
		},

		NvimTreeGitNew = {
			fg = base30.yellow,
		},

		NvimTreeGitDeleted = {
			fg = base30.red,
		},

		NvimTreeSpecialFile = {
			fg = base30.yellow,
			bold = true,
		},

		NvimTreeRootFolder = {
			fg = base30.red,
			bold = true,
		},
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
		["@markup.heading.1.markdown"] = { fg = base16.base07 },
		["@markup.heading.2.markdown"] = { fg = base16.base0E },
		["@markup.heading.3.markdown"] = { fg = base16.base08 },
		["@markup.heading.4.markdown"] = { fg = base16.base0A },
		["@markup.heading.5.markdown"] = { fg = base16.base0D },
		["@markup.heading.6.markdown"] = { fg = base16.base09 },
		["@MarkviewCode"] = { bg = base30.lightbg },
	},
	treesitter = {
		["@variable"] = { fg = base16.base08 },
		["@variable.r"] = { fg = generate_color(base16.base08, 3) },
		["@variable.member.r"] = { fg = generate_color(base16.base08, -3) },
		["@variable.builtin"] = { fg = generate_color(base16.base09, 5) },
		["@variable.parameter"] = { fg = base16.base08 },
		["@variable.parameter.r"] = { fg = base30.orange },
		["@variable.member"] = { fg = base16.base08 },
		["@variable.member.key"] = { fg = base16.base08 },

		["@module"] = { fg = base16.base08 },

		["@constant"] = { fg = base16.base08 },
		["@constant.builtin"] = { fg = base16.base09 },
		["@constant.macro"] = { fg = base16.base08 },

		["@string"] = { fg = base16.base0B },
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

		["@operator"] = { fg = generate_color(base16.base06, 5) },
		["@reference"] = { fg = base16.base05 },
		["@punctuation.bracket"] = { fg = base16.base06 },
		["@punctuation.delimiter"] = { fg = base16.base09 },
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

		["@comment"] = { fg = base30.lightbg },
		["@comment.todo"] = { fg = base30.grey, bg = base30.white },
		["@comment.warning"] = { fg = base30.black2, bg = base16.base09 },
		["@comment.note"] = { fg = base30.black, bg = base30.blue },
		["@comment.danger"] = { fg = base30.black2, bg = base30.red },

		["@diff.plus"] = { fg = base30.green },
		["@diff.minus"] = { fg = base30.red },
		["@diff.delta"] = { fg = base30.light_grey },

		-- ['@NeogitDiffDelete'] = { bg = base30.one_black, fg = base30.light_grey },
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
		String = { fg = base16.base0B },
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

-- vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = base30.one_bg })

M = require("base46").override_theme(M, "amber")

return M
