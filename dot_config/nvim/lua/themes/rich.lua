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
	base00 = "#0f0e0f",
	base01 = "#101111",
	base02 = "#20141a",
	base03 = "#282228",
	base04 = "#4c3f30",
	base05 = "#86796e",
	base06 = "#7e4c54",
	base07 = "#81876c",
	base08 = "#a09782",
	base09 = "#b48d95",
	base0A = "#cb9484",
	base0B = "#689081",
	base0C = "#9d7774",
	base0D = "#ca9178",
	base0E = "#b19b7f",
	base0F = "#a37d79",
}
-- UI
local base30 = {
	white = base16.base08,
	black = base16.base00,
	darker_black = base16.base01,
	black2 = shade(base16.base02, -2),
	one_bg = base16.base01,
	one_bg2 = base16.base02,
	one_bg3 = base16.base03,
	grey = base16.base02,
	grey_fg = shade(base16.base03, 20),
	grey_fg2 = shade(base16.base03, 30),
	light_grey = mix(base16.base02, base16.base05, 30),
	red = base16.base0C,
	baby_pink = shade(base16.base0D, 10),
	pink = base16.base0D,
	line = base16.base06,
	green = base16.base07,
	vibrant_green = shade(base16.base07, 10),
	nord_blue = base16.base09,
	blue = mix(base16.base09, base16.base0D, 65),
	seablue = mix(base16.base09, base16.base0D, 45),
	yellow = base16.base0E,
	sun = mix(base16.base0E, base16.base0A, 65),
	purple = base16.base0F,
	dark_purple = mix(base16.base0F, base16.base02, 20),
	teal = mix(base16.base0D, base16.base09, 65),
	cyan = mix(base16.base09, base16.base0D, 65),
	orange = mix(base16.base0C, base16.base0E, 40),
	statusline_bg = shade(base16.base06, -32),
	lightbg = base16.base05,
	pmenu_bg = base16.base03,
	folder_bg = base16.base02,
}

local polish_hl = {
	defaults = {
		Added = { fg = base30.green },
		Removed = { fg = base30.pink },
		Changed = { fg = base30.yellow },
		WinSeparator = { fg = base30.line },
		Pmenu = { bg = base30.pmenu_bg, fg = base16.base04 },
		PmenuSbar = { bg = base30.pmenu_bg },
		PmenuSel = { bg = shade(base16.base06, -30), fg = shade(base30.orange, 20), bold = true },
		PmenuThumb = { bg = base30.grey },
		FloatBorder = { fg = base16.base03, bg = base30.one_bg },
		FloatTitle = { fg = base30.white, bg = base30.black2 },
		NormalFloat = { bg = base30.black3 },
		Title = { fg = shade(base30.white, 5), bg = base30.one_bg3, bold = true, sp = "none" },
		WildMenu = { fg = base16.base08, bg = base16.base0A },
		QuickFixLine = { bg = base16.base04, bold = true },
		Question = { fg = base16.base0D },
		Search = { link = "Visual" },
		Substitute = { fg = base16.base01, bg = base16.base07, bold = true, sp = "none" },
		IncSearch = {
			bg = base16.base08,
			fg = base16.base00,
			bold = true,
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
		Visual = { bg = shade(base16.base08, -25), italic = true },
		VisualNOS = { fg = base16.base09 },
		Macro = { fg = base16.base08 },
		Cursor = { fg = base16.base00, bg = base16.base05, bold = true },
		CursorLine = { bg = shade(base16.base06, -30) },
		CursorColumn = { link = "CursorLine" },
		CursorLineNr = { fg = base16.base05 },
		SignColumn = { fg = base16.base03, sp = "NONE" },
		ColorColumn = { bg = base30.black2 },
		LineNr = { fg = base16.base04 },
		FoldColumn = { bg = "none" },
		Folded = { bg = base30.one_bg },
		CurSearch = { link = "IncSearch" },
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
		LazyH1 = {
			bg = shade(base30.one_bg3, -10),
			fg = base30.green,
			bold = true,
		},
		LazyButton = {
			bg = shade(base30.one_bg3, -10),
			fg = base30.dark_purple,
		},
		LazyButtonActive = {
			bg = shade(base30.one_bg3, -10),
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
	markview = {
		["@markup.heading.1.markdown"] = { fg = base16.base0F },
		["@markup.heading.2.markdown"] = { fg = shade(base16.base0F, 10) },
		["@markup.heading.3.markdown"] = { fg = base16.base06 },
		["@markup.heading.4.markdown"] = { fg = shade(base16.base06, 10) },
		["@markup.heading.5.markdown"] = { fg = shade(base16.base0E, -20) },
		["@markup.heading.6.markdown"] = { fg = shade(base16.base0E, -10) },
		["@MarkviewCode"] = { bg = base30.one_bg },
		["@markviewCheckboxUnchecked"] = { fg = base16.base07 },
	},
	treesitter = {
		["@variable"] = { fg = base16.base08 },
		["@variable.member.r"] = { fg = base16.base0E },
		["@variable.builtin"] = { fg = shade(base16.base0F, 10) },
		["@variable.parameter"] = { fg = base16.base08 },
		["@variable.parameter.r"] = { fg = base16.base06 },
		["@variable.member"] = { fg = base16.base08 },
		["@variable.member.key"] = { fg = base16.base08 },
		["@module"] = { fg = base16.base08 },
		["@constant"] = { fg = base16.base06, bold = true, italic = true },
		["@constant.builtin"] = { fg = base16.base06 },
		["@constant.macro"] = { fg = base16.base08 },
		["@string"] = { fg = base16.base05, italic = true },
		["@string.documentation"] = { fg = mix(base16.base02, base16.base08, 65) },
		["@string.regex"] = { fg = base16.base06, bold = true },
		["@string.escape"] = { fg = base16.base06, bold = true },
		["@string.csv"] = { fg = base16.base04 },
		["@character"] = { fg = base16.base08 },
		["@number"] = { fg = base16.base0B },
		["@number.float"] = { fg = base16.base0B },
		["@annotation"] = { fg = base16.base0F },
		["@attribute"] = { fg = base16.base0A },
		["@error"] = { fg = base16.base08 },
		["@keyword.exception"] = { fg = base16.base08 },
		["@keyword"] = { fg = base16.base0B },
		["@keyword.function"] = { fg = base16.base0B },
		["@keyword.return"] = { fg = base16.base0B },
		["@keyword.operator"] = { fg = base16.base0B },
		["@keyword.import"] = { link = "Include" },
		["@keyword.conditional"] = { fg = base16.base0B },
		["@keyword.conditional.ternary"] = { fg = base16.base0B },
		["@keyword.repeat"] = { fg = base16.base0B },
		["@keyword.storage"] = { fg = base16.base0B },
		["@keyword.directive.define"] = { fg = base16.base0B },
		["@keyword.directive"] = { fg = base16.base0B },
		["@function"] = { fg = base16.base0D },
		["@function.builtin"] = { fg = base16.base0D },
		["@function.macro"] = { fg = base16.base08 },
		["@function.call"] = { fg = base16.base0D },
		["@function.method"] = { fg = base16.base0D },
		["@function.method.call"] = { fg = base16.base0D },
		["@constructor"] = { fg = base16.base09 },
		["@constructor.lua"] = { fg = base16.base0F },
		["@operator"] = { fg = base16.base06 },
		["@reference"] = { fg = base16.base05 },
		["@punctuation.bracket"] = { fg = base16.base06, bold = true },
		["@punctuation.delimiter"] = { fg = base16.base06, bold = true },
		["@punctuation.special.python"] = { fg = base16.base06, bold = true },
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
		["@comment.todo"] = { fg = base30.grey, bg = base30.white },
		["@comment.warning"] = { fg = base30.black2, bg = base16.base09 },
		["@comment.note"] = { fg = base30.black, bg = base30.blue },
		["@comment.danger"] = { fg = base30.black2, bg = base30.red },
		["@diff.plus"] = { fg = base30.green },
		["@diff.minus"] = { fg = base30.red },
		["@diff.delta"] = { fg = base30.light_grey },
	},
	snacks = {
		["@SnacksIndent"] = { fg = base16.base04 },
		["@SnacksIndentScope"] = { fg = base30.line },
		["@SnacksDashboardKey"] = { fg = base16.base04, bold = true },
		["@SnacksDashboardHeader"] = { fg = shade(base16.base04, 10) },
		["@SnacksDashboardDir"] = { fg = shade(base16.base04, -10) },
	},
	blinkcmp = {
		["@BlinkCmpDoc"] = { link = "pmenu" },
		["@BlinkCmpDocBorder"] = { link = "pmenu" },
		["@BlinkCmpGhostText"] = { fg = base16.base04 },
	},
	treesitter_context = {
		["@TreesitterContext"] = { bg = base30.one_bg },
		["@TreesitterContextSeparator"] = { fg = shade(base16.base03, 20), bg = base30.one_bg },
	},
	whichkey = {
		WhichKey = { fg = base16.base0A },
		WhichKeySeparator = { link = "WinSeparator" },
		WhichKeyDesc = { fg = base16.base0B },
		WhichKeyGroup = { fg = base16.base07 },
		WhichKeyValue = { fg = base16.base0A },
		["@WhichKeyBorder"] = { link = "FloatBorder" },
		["@WhichKeyTitle"] = { fg = base16.base07 },
	},
	bqf = {
		BqfPreviewFloat = { bg = base30.one_bg },
	},
	vgit = {
		GitSignsAdd = { fg = base30.green, bg = "NONE" },
		GitSignsDelete = { fg = base30.red, bg = "NONE" },
		GitSignsChange = { fg = base30.yellow, bg = "NONE" },
		GitSignsAddLn = { fg = base30.green, bg = shade(base30.green, -35) },
		GitSignsDeleteLn = { fg = base30.red, bg = shade(base30.red, -35) },
		GitWordAdd = { fg = base30.green, bg = shade(base30.green, -35), bold = true },
		GitWordDelete = { fg = base30.red, bg = shade(base30.red, -35), bold = true },
		GitConflictCurrentMark = { fg = base30.green, bg = shade(base30.green, -35) },
		GitConflictCurrent = { fg = base30.green, bg = shade(base30.green, -35) },
		GitConflictIncomingMark = { fg = base30.blue, bg = shade(base30.blue, -35) },
		GitConflictIncoming = { fg = base30.blue, bg = shade(base30.blue, -35) },
		GitConflictAncestorMark = { fg = base30.purple, bg = shade(base30.purple, -35) },
		GitConflictAncestor = { fg = base30.purple, bg = shade(base30.purple, -35) },
		GitConflictMiddle = { fg = base16.base04, bg = base30.one_bg2 },
		GitBackground = { fg = base16.base05, bg = base16.base03 },
		GitAppBar = { fg = base16.base05, bg = shade(base16.base04, -10) },
		GitHeader = { fg = base16.base08, bg = shade(base16.base04, -10) },
		GitFooter = { fg = base16.base04, bg = shade(base16.base04, -10) },
	},
	syntax = {
		Boolean = { fg = base16.base09 },
		Character = { fg = base16.base08 },
		Conditional = { fg = base16.base0E },
		Constant = { fg = base16.base08, bold = true, italic = true },
		Define = { fg = base16.base0E, sp = "none" },
		Delimiter = { fg = base16.base0F },
		Float = { fg = base16.base0B },
		Variable = { fg = base16.base05 },
		Function = { fg = base16.base0D },
		Identifier = { fg = base16.base08, sp = "none" },
		Include = { fg = base16.base0D },
		Keyword = { fg = base16.base0B },
		Label = { fg = base16.base0A },
		Number = { fg = base16.base0B },
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

M = require("base46").override_theme(M, "rich")

local hl = vim.api.nvim_set_hl

hl(0, "BlinkCmpMenu", { bg = base30.black2 })
hl(0, "BlinkCmpMenuBorder", { bg = base30.black2, fg = base16.base07 })
hl(0, "BlinkCmpDoc", { bg = base30.black2 })
hl(0, "BlinkCmpDocBorder", { bg = base30.black2, fg = base16.base07 })
hl(0, "BlinkCmpGhostText", { fg = base16.base04 })
hl(0, "BlinkCmpSignatureHelp", { bg = base30.black2 })
hl(0, "BlinkCmpSignatureHelpBorder", { bg = "none", fg = base16.base07 })
hl(0, "BlinkCmpSignatureHelpActiveParameter", { fg = base16.base07, bold = true })
hl(0, "MarkviewCheckboxUnchecked", { fg = base16.base07 })
hl(0, "MarkviewCode", { bg = base30.one_bg })
hl(0, "SnacksIndent", { fg = base16.base04 })
hl(0, "SnacksIndentScope", { fg = base30.line })
hl(0, "SnacksDashboardKey", { fg = base16.base04, bold = true })
hl(0, "SnacksDashboardHeader", { fg = shade(base16.base04, 10) })
hl(0, "SnacksDashboardDir", { fg = shade(base16.base04, -10) })
hl(0, "WhichKeyTitle", { fg = base16.base07 })
hl(0, "BqfPreviewFloat", { bg = base30.one_bg })
hl(0, "UfoFoldedBg", { bg = shade(base30.one_bg2, -5) })
hl(0, "HauntAnnotation", { link = "Cursor", bold = true })
hl(0, "HauntSign", { link = "DiagnosticWarn" })
hl(0, "GitSignsAdd", { fg = base30.green, bg = "NONE" })
hl(0, "GitSignsDelete", { fg = base30.pink, bg = "NONE" })
hl(0, "GitSignsChange", { fg = base30.yellow, bg = "NONE" })

return M
