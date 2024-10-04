-- if vim.g.colors_name ~= nil then
-- 	vim.cmd("highlight clear")
-- end

--   Desklight (v0.5; Sept 7 2024)
--
--   A dark colorscheme for Neovim employing soft pastels with medium contrast.
--   Individual colours inspired by themes such as nightlamp and kanagawa.
--   Approach inspired by the "base16" and "bones" theme families/styles.
--
--   Intended to be both discriminable and gentle regardless of lighting,
--   and attempts to look pretty even for those who are colourblind.
--   (minus grayscale for the obvious reasons)

Desklight = {}
Desklight.base = {
	base00 = "#272427",
	base01 = "#262026",
	base02 = "#2c2530",
	base03 = "#59574c",
	base04 = "#5a5954",
	base05 = "#c5bfab",
	base06 = "#d5ccbb",
	base07 = "#e0d6bd",
	base08 = "#caa8d0",
	base09 = "#c18c7e",
	base0A = "#ccb29c",
	base0B = "#b5aeb0",
	base0C = "#a7a6e0",
	base0D = "#c799a2",
	base0E = "#afbdd6",
	base0F = "#a9c9bf",
}

Desklight.syntax = {
	winsep = Desklight.base.base07,
	operator = Desklight.base.base0B,
	delimiter = Desklight.base.base0A,
	float = Desklight.base.base06,
}

Desklight.plugins = {
	barbar = {
		alternate = {
			added = nil,
			btn = nil,
			changed = nil,
			deleted = nil,
			error = nil,
			hint = nil,
			icon = nil,
			index = nil,
			info = nil,
			mod = nil,
			modbtn = nil,
			number = nil,
			pin = nil,
			pinbtn = nil,
			sign = nil,
			signright = nil,
			target = nil,
			warn = nil,
		},
		current = {
			added = nil,
			btn = nil,
			changed = nil,
			deleted = nil,
			error = nil,
			hint = nil,
			icon = nil,
			index = Desklight.base.base0F,
			info = nil,
			mod = Desklight.base.base0D,
			modbtn = Desklight.base.base0D,
			number = nil,
			pin = Desklight.base.base0C,
			pinbtn = Desklight.base.base0C,
			sign = nil,
			signright = nil,
			target = nil,
			warn = nil,
		},
		inactive = {
			added = nil,
			btn = nil,
			changed = nil,
			deleted = nil,
			error = nil,
			hint = nil,
			icon = nil,
			index = nil,
			info = nil,
			mod = nil,
			modbtn = nil,
			number = nil,
			pin = nil,
			pinbtn = nil,
			sign = nil,
			signright = nil,
			target = nil,
			warn = nil,
		},
		active = {
			added = nil,
			btn = nil,
			changed = nil,
			deleted = nil,
			error = nil,
			hint = nil,
			icon = nil,
			index = nil,
			info = nil,
			mod = nil,
			modbtn = nil,
			number = nil,
			pin = nil,
			pinbtn = nil,
			sign = nil,
			signright = nil,
			target = nil,
			warn = nil,
		},
	},
	markview = {
		headings = {
			h1 = Desklight.base.base0B,
			h2 = Desklight.base.base0D,
			h3 = Desklight.base.base08,
			h4 = Desklight.base.base0A,
			h5 = Desklight.base.base0E,
			h6 = Desklight.base.base0F,
		},
		boxes = {
			checked = Desklight.base.base0F,
			unchecked = Desklight.base.base0D,
			pending = Desklight.base.base0C,
			progress = Desklight.base.base0C,
			cancelled = Desklight.base.base0A,
		},
		lists = {
			plus = Desklight.base.base0F,
			minus = Desklight.base.base0D,
			star = Desklight.base.base0E,
		},
		tables = {
			border = Desklight.base.base0E,
			left = Desklight.base.base0E,
			right = Desklight.base.base0E,
			center = Desklight.base.base0E,
		},
	},
}

require("mini.base16").setup({ palette = Desklight.base })
vim.g.colors_name = "desklight"

-- | Highlight mods
local setfg = function(group, color)
	vim.cmd("highlight " .. group .. " guifg=" .. color)
end

-- | Basic syntax
local syntax = Desklight.syntax

setfg("WinSeparator", syntax.winsep)
setfg("Operator", syntax.operator)
setfg("Delimiter", syntax.delimiter)
setfg("Float", syntax.float)

-- | Markview
local mkview = Desklight.plugins.markview

setfg("MarkviewHeading1", mkview.headings.h1)
setfg("MarkviewHeadingSign1", mkview.headings.h1)
setfg("MarkviewHeading2", mkview.headings.h2)
setfg("MarkviewHeadingSign2", mkview.headings.h2)
setfg("MarkviewHeading3", mkview.headings.h3)
setfg("MarkviewHeadingSign3", mkview.headings.h3)
setfg("MarkviewHeading4", mkview.headings.h4)
setfg("MarkviewHeadingSign4", mkview.headings.h4)
setfg("MarkviewHeading5", mkview.headings.h5)
setfg("MarkviewHeadingSign5", mkview.headings.h5)
setfg("MarkviewHeading6", mkview.headings.h6)
setfg("MarkviewHeadingSign6", mkview.headings.h6)

setfg("MarkviewCheckboxChecked", mkview.boxes.checked)
setfg("MarkviewCheckboxUnchecked", mkview.boxes.unchecked)
setfg("MarkviewCheckboxPending", mkview.boxes.pending)
setfg("MarkviewCheckboxProgress", mkview.boxes.progress)
setfg("MarkviewCheckboxCancelled", mkview.boxes.cancelled)

setfg("MarkviewListItemPlus", mkview.lists.plus)
setfg("MarkviewListItemMinus", mkview.lists.minus)
setfg("MarkviewListItemStar", mkview.lists.star)

setfg("MarkviewTableBorder", mkview.tables.border)
setfg("MarkviewTableAlignLeft", mkview.tables.left)
setfg("MarkviewTableAlignRight", mkview.tables.right)
setfg("MarkviewTableAlignCenter", mkview.tables.center)

-- Terminal colors
-- local g = vim.g
-- local base = Desklight.base
--
-- g.terminal_color_0 = base.base00
-- g.terminal_color_1 = base.base01
-- g.terminal_color_2 = base.base02
-- g.terminal_color_3 = base.base03
-- g.terminal_color_4 = base.base04
-- g.terminal_color_5 = base.base05
-- g.terminal_color_6 = base.base06
-- g.terminal_color_7 = base.base07
-- g.terminal_color_8 = base.base08
-- g.terminal_color_9 = base.base09
-- g.terminal_color_10 = base.base0A
-- g.terminal_color_11 = base.base0B
-- g.terminal_color_12 = base.base0C
-- g.terminal_color_13 = base.base0D
-- g.terminal_color_14 = base.base0E
-- g.terminal_color_15 = base.base0F
