---@type fun(hex: string, amount: number): string
local shade = require("base46.colors").change_hex_lightness
---@type fun(color1: string, color2: string, weight: number): string
local mix = require("base46.colors").mix
-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Light Background (Not often used)
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
local M = {}
local base16 = {
	base00 = "#100e10",
	base01 = "#100f12",
	base02 = "#101015",
	base03 = "#161111",
	base04 = "#5f514a",
	base05 = "#b6aaa4",
	base06 = "#8b6b6f",
	base07 = "#989b94",
	base08 = "#b0a19b",
	base09 = "#9c8e9e",
	base0A = "#9e7a7f",
	base0B = "#a8a194",
	base0C = "#a57370",
	base0D = "#9ea19e",
	base0E = "#aaa39b",
	base0F = "#9f8b98",
}
-- UI
local base30 = {
	white = base16.base08,
	black = base16.base00,
	darker_black = base16.base01,
	black2 = base16.base02,
	one_bg = base16.base01,
	one_bg2 = base16.base02,
	one_bg3 = base16.base03,
	grey = base16.base02,
	grey_fg = base16.base05,
	grey_fg2 = base16.base04,
	light_grey = mix(base16.base02, base16.base05, 30),
	red = base16.base0C,
	baby_pink = shade(base16.base0A, 15),
	pink = shade(base16.base0A, 5),
	line = base16.base0B,
	green = base16.base07,
	vibrant_green = shade(base16.base07, 10),
	nord_blue = base16.base09,
	blue = mix(base16.base09, base16.base0D, 65),
	seablue = mix(base16.base09, base16.base0D, 45),
	yellow = shade(base16.base0E, 10),
	sun = mix(base16.base0E, base16.base0A, 65),
	purple = base16.base0F,
	dark_purple = mix(base16.base0F, base16.base02, 20),
	teal = mix(base16.base0D, base16.base09, 65),
	cyan = mix(base16.base09, base16.base0D, 65),
	orange = mix(base16.base0C, base16.base0E, 40),
	statusline_bg = base16.base02,
	lightbg = base16.base05,
	pmenu_bg = base16.base03,
	folder_bg = base16.base02,
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
		Pmenu = { bg = base30.pmenu_bg, fg = base16.base04 },
		PmenuSbar = { bg = base30.pmenu_bg },
		PmenuSel = { bg = shade(base16.base06, -30), fg = shade(base30.orange, 20), bold = true },
		PmenuThumb = { bg = base30.grey },
		-- FloatBorder = { fg = base30.red, bg = base30.black2 },
		FloatBorder = { fg = base16.base04, bg = base30.black2 },
		FloatTitle = { fg = base30.red, bg = base30.black2 },
		NormalFloat = { bg = base30.black2 },
		Title = { fg = base16.base0D, sp = "none" },
		WildMenu = { fg = base16.base08, bg = base16.base0A },

		QuickFixLine = { bg = base16.base01, sp = "none" },
		Question = { fg = base16.base0D },
		Search = { fg = base16.base00, bg = base16.base06 },
		Substitute = { fg = base16.base01, bg = base16.base07, bold = true, sp = "none" },
		IncSearch = {
			bg = base30.orange,
			fg = base16.base00,
			bold = true,
			italic = true,
		},
		MatchWord = { link = "IncSearch" },
		MatchParen = { link = "MatchWord" },

		Normal = { fg = base16.base05, bg = base16.base00 },
		Italic = { italic = true },
		Bold = { bold = true },
		UnderLined = { underline = true },
		Conceal = { bg = "NONE" },
		NonText = { fg = base16.base0B },
		DevIconDefault = { fg = base30.red },
		Directory = { fg = base16.base0D },

		ModeMsg = { fg = base16.base0B },
		MoreMsg = { fg = base16.base0B },
		Visual = {
			bg = shade(base30.nord_blue, -30),
			fg = base30.orange,
			italic = true,
			bold = true,
		},
		VisualNOS = { fg = base16.base09 },
		Macro = { fg = base16.base08 },

		Cursor = { fg = base16.base00, bg = base16.base05 },
		CursorColumn = { bg = base16.base01, sp = "none" },
		CursorLine = { bg = mix(shade(base30.white, -40), base16.base00, 75) },
		CursorLineNr = { fg = base30.white },
		SignColumn = { fg = base16.base03, sp = "NONE" },
		ColorColumn = { bg = base30.black2 },
		LineNr = { fg = base16.base04 },
		FoldColumn = { bg = "none" },
		Folded = { fg = base30.light_grey, bg = base30.black2 },
		CurSearch = { fg = base16.base00, bg = base30.sun, bold = true },

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
			bg = shade(base16.base06, -40),
			fg = base30.green,
			bold = true,
		},
		LazyButton = {
			bg = shade(base16.base06, -40),
			fg = base30.dark_purple,
		},
		LazyButtonActive = {
			bg = shade(base16.base06, -40),
			fg = base30.green,
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
	-- statusline = {
	-- 	St_LspMsg = { fg = base16.base06 },
	-- 	St_Lsp = { fg = base16.base06 },
	-- },
	neogit = {
		NeogitCommitViewHeader = {
			bg = shade(base30.purple, -20),
			fg = base16.base08,
		},
		NeogitDiffContext = {
			bg = shade(base16.base03, -5),
			fg = shade(base30.light_grey, -5),
		},
		NeogitDiffContextHighlight = {
			bg = shade(base16.base03, -2),
			fg = base30.light_grey,
		},
		NeogitDiffContextCursor = {
			bg = shade(base16.base03, -2),
			fg = base16.base08,
		},
		NeogitHunkHeader = {
			fg = shade(base16.base08, -20),
			bg = shade(base16.base04, -25),
		},
		NeogitHunkHeaderHighlight = {
			fg = shade(base16.base04, -30),
			bg = shade(base16.base08, -25),
		},
		NeogitHunkHeaderCursor = {
			fg = shade(base16.base04, -30),
			bg = shade(base16.base08, -25),
		},
		NeogitDiffAdd = {
			fg = shade(mix(base30.green, base16.base03, 50), -5),
			bg = shade(mix(base30.green, base16.base03, 40), -35),
		},
		NeogitDiffAddHighlight = {
			fg = shade(base30.green, -8),
			bg = shade(base30.green, -50),
		},
		NeogitDiffAddCursor = {
			fg = mix(base30.green, "#FFFFFF", 40),
			bg = shade(base30.green, -50),
		},
		NeogitDiffDelete = {
			fg = shade(mix(base30.red, base16.base03, 50), -5),
			bg = shade(mix(base30.red, base16.base03, 45), -30),
		},
		NeogitDiffDeleteHighlight = {
			fg = shade(base30.red, -3),
			bg = shade(base30.red, -45),
		},
		NeogitDiffDeleteCursor = {
			fg = mix(base30.red, "#FFFFFF", 30),
			bg = shade(base30.red, -45),
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
		["@markup.heading.1.markdown"] = { fg = base16.base0F },
		["@markup.heading.2.markdown"] = { fg = shade(base16.base0F, 10) },
		["@markup.heading.3.markdown"] = { fg = base16.base06 },
		["@markup.heading.4.markdown"] = { fg = shade(base16.base06, 10) },
		["@markup.heading.5.markdown"] = { fg = shade(base16.base0E, -20) },
		["@markup.heading.6.markdown"] = { fg = shade(base16.base0E, -10) },
		["@markviewCode"] = { bg = base30.one_bg },
		["@markviewCheckboxUnchecked"] = { fg = base16.base07 },
	},
	treesitter = {
		["@variable"] = { fg = base16.base08 },
		["@variable.r"] = { fg = mix(base16.base08, "#DDDDDD", 25) },
		["@variable.member.r"] = { fg = shade(base16.base08, -3) },
		["@variable.builtin"] = { fg = shade(base16.base0F, 10) },
		["@variable.parameter"] = { fg = base16.base08 },
		["@variable.parameter.r"] = { fg = base16.base06 },
		["@variable.member"] = { fg = base16.base08 },
		["@variable.member.key"] = { fg = base16.base08 },

		["@module"] = { fg = base16.base08 },

		["@constant"] = { fg = base16.base06 },
		["@constant.builtin"] = { fg = base16.base06 },
		["@constant.macro"] = { fg = base16.base08 },

		["@string.regex"] = { fg = base16.base0C },
		["@string.escape"] = { fg = base16.base0C },
		["@string.csv"] = { fg = base16.base04 },
		["@character"] = { fg = base16.base08 },
		["@number"] = { fg = shade(base16.base04, 20) },
		["@number.float"] = { fg = shade(base16.base04, 20) },

		["@annotation"] = { fg = base16.base0F },
		["@attribute"] = { fg = base16.base0A },
		["@error"] = { fg = base16.base08 },

		["@keyword.exception"] = { fg = base16.base08 },
		["@keyword"] = { fg = base16.base0E },
		["@keyword.function"] = { fg = base16.base09 },
		["@keyword.function.r"] = { fg = base16.base0F },
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
		["@function.method"] = { fg = base16.base0D },
		["@function.method.call"] = { fg = base16.base0D },
		["@constructor"] = { fg = base16.base0C },
		["@constructor.lua"] = { fg = base16.base0F },

		["@operator"] = { fg = base16.base06 },
		["@operator.r"] = { fg = base16.base06 },
		["@reference"] = { fg = base16.base05 },
		["@punctuation.bracket"] = { fg = base16.base06 },
		["@punctuation.delimiter"] = { fg = base16.base06 },
		["@symbol"] = { fg = base16.base0B },
		["@tag"] = { fg = base16.base06 },
		["@tag.attribute"] = { fg = base16.base08 },
		["@tag.delimiter"] = { fg = base16.base06 },
		["@text"] = { fg = base16.base05 },
		["@text.emphasis"] = { fg = base16.base09 },
		["@text.strike"] = { fg = base16.base0F, strikethrough = true },
		["@type.builtin"] = { fg = base16.base06 },
		["@definition"] = { sp = base16.base04, underline = true },
		["@scope"] = { bold = true },
		["@property"] = { fg = base16.base08 },

		-- markup
		["@markup.heading"] = { fg = base16.base0D },
		["@markup.raw"] = { fg = base16.base09 },
		["@markup.link"] = { fg = base16.base08 },
		["@markup.link.url"] = { fg = base16.base09, underline = true },
		["@markup.link.label"] = { fg = base16.base0C },
		["@markup.list.markdown"] = { fg = base16.base07 },
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

		["@FzfLuaFzfMatch"] = { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true },
		["@FzfLuaFzfMarker"] = { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true },
		["@FzfLuaSearch"] = { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true },
		["@FzfLuaBorder"] = { link = "FloatBorder" },
	},
	fzflua = {
		["@FzfLuaFzfMatch"] = { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true },
		["@FzfLuaFzfMarker"] = { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true },
		["@FzfLuaSearch"] = { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true },
		["@FzfLuaBorder"] = { link = "FloatBorder" },
	},
	snacks = {
		["@SnacksIndent"] = { fg = base16.base04 },
		["@SnacksIndentScope"] = { fg = base30.line },
		["@SnacksDashboardKey"] = { fg = base16.base04, bold = true },
		["@SnacksDashboardHeader"] = { fg = shade(base16.base04, 10) },
		["@SnacksDashboardDir"] = { fg = shade(base16.base04, -10) },
	},
	blinkcmp = {
		["@BlickCmpDoc"] = { link = "pmenu" },
		["@BlinkCmpDocBorder"] = { link = "pmenu" },
		["@BlinkCmpGhostText"] = { fg = base16.base04 },
	},
	avante = {
		["@AvanteSidebarNormal"] = { bg = base30.one_bg },
		["@AvantePromptInputBorder"] = { link = "FloatBorder" },
	},
	leap = {
		["@LeapBackdrop"] = { bg = shade(base16.base03, -5), fg = base16.base04 },
		["@LeapLabelDimmed"] = { bg = shade(base16.base03, -5), fg = base16.base09 },
	},
	-- flash = {
	-- 	["@FlashMatch"] = { link = "Normal" },
	-- },
	treesitter_context = {
		["@TreesitterContext"] = { bg = base30.one_bg },
		["@TreesitterContextSeparator"] = { fg = shade(base16.base03, 20), bg = base30.one_bg },
	},
	multi_cursor = {
		["@MultiCursorCursor"] = { link = "Cursor" },
		["@MultiCursorVisual"] = { link = "Visual" },
	},
	whichkey = {
		WhichKey = { fg = base16.base0A },
		WhichKeySeparator = { link = "WinSeparator" },
		WhichKeyDesc = { fg = base16.base0B },
		WhichKeyGroup = { fg = base16.base07 },
		WhichKeyValue = { fg = base16.base0A },
		-- ["@WhichKeyBorder"] = { fg = shade(base16.base09, -20), bg = base30.one_bg },
		["@WhichKeyBorder"] = { link = "FloatBorder" },
		["@WhichKeyTitle"] = { fg = base16.base07 },
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
		Special = { fg = base16.base0B },
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

M = require("base46").override_theme(M, "amber")

local hl = vim.api.nvim_set_hl

hl(0, "BlinkCmpMenu", { bg = base30.black2 })
hl(0, "BlinkCmpMenuBorder", { bg = base30.black2, fg = base16.base07 })
hl(0, "BlinkCmpDoc", { bg = base30.black2 })
hl(0, "BlinkCmpDocBorder", { bg = base30.black2, fg = base16.base07 })
hl(0, "BlinkCmpGhostText", { fg = base16.base04 })
hl(0, "BlinkCmpSignatureHelp", { bg = base30.black2 })
hl(0, "BlinkCmpSignatureHelpBorder", { bg = "none", fg = base16.base07 })
hl(0, "BlinkCmpSignatureHelpActiveParameter", { fg = base16.base07, bold = true })
hl(0, "FlashMatch", { fg = shade(base16.base07, -10) })
hl(0, "MarkviewCheckboxUnchecked", { fg = base16.base07 })
hl(0, "MarkviewCode", { bg = base30.black2 })
hl(0, "SnacksIndent", { fg = base16.base04 })
hl(0, "SnacksIndentScope", { fg = base30.line })
hl(0, "SnacksDashboardKey", { fg = base16.base04, bold = true })
hl(0, "SnacksDashboardHeader", { fg = shade(base16.base04, 10) })
hl(0, "SnacksDashboardDir", { fg = shade(base16.base04, -10) })
hl(0, "WhichKeyTitle", { fg = base16.base07 })
hl(0, "FylerNormal", { link = "NormalFloat" })

return M
