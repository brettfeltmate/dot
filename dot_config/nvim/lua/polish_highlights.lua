local base16 = require("base46").get_theme_tb("base_16")
local base30 = require("base46").get_theme_tb("base_30")

local shade = require("base46.colors").change_hex_lightness
local mix = require("base46.colors").mix

local hl = vim.api.nvim_set_hl

hl(0, "FzfLuaFzfMatch", { bg = base30.grey_fg, fg = base30.purple })
hl(0, "FzfLuaFzfMarker", { bg = base30.grey_fg, fg = base30.purple })
hl(0, "FzfLuaBorder", { link = "FloatBorder" })
hl(0, "MiniClueSeparator", { link = "WinSeparator" })
hl(0, "MiniClueDescGroup", { fg = base30.orange })
hl(0, "MiniClueDescSingle", { fg = shade(base16.base04, 25) })
hl(0, "MiniClueNextKey", { fg = base16.base0A })
hl(0, "MarkviewCode", { bg = "#1e171c" })
hl(0, "SnacksIndent", { fg = base16.base04 })
hl(0, "SnacksIndentScope", { fg = base30.nord_blue })
hl(0, "BlinkCmpDoc", { link = "pmenu" })
hl(0, "BlinkCmpDocBorder", { link = "pmenu" })
hl(0, "SnacksDashboardKey", { fg = base16.base04, bold = true })
hl(0, "SnacksDashboardHeader", { fg = shade(base16.base04, 10) })
hl(0, "SnacksDashboardDir", { fg = shade(base16.base04, -10) })
hl(0, "@string.csv", { fg = base16.base04 })
hl(0, "@number.csv", { fg = base16.base06 })
hl(0, "@number.float.csv", { fg = base16.base09 })
hl(0, "WhichKeySeparator", { link = "WinSeparator" })
hl(0, "WhichKey", { fg = base16.base0A, bold = true })
hl(0, "WhichKeyDesc", { fg = shade(base16.base04, 25) })
hl(0, "WhichKeyGroup", { fg = base16.base07 })
hl(0, "WhichKeyBorder", { fg = base16.base04 })
hl(0, "WhichKeyTitle", { fg = base16.base0C, bold = true })
hl(0, "MultiCursorCursor", { link = "Cursor" })
hl(0, "MultiCursorVisual", { link = "Visual" })
