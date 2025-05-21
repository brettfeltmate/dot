local base16 = require("base46").get_theme_tb("base_16")
local base30 = require("base46").get_theme_tb("base_30")

---@type fun(hex: string, amount: number): string
local shade = require("base46.colors").change_hex_lightness
---@type fun(color1: string, color2: string, weight: number): string
local mix = require("base46.colors").mix

local hl = vim.api.nvim_set_hl

hl(0, "FzfLuaFzfMatch", { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true })
hl(0, "FzfLuaFzfMarker", { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true })
hl(0, "FzfLuaSearch", { bg = base16.base04, fg = shade(base16.base09, 20), bold = true, italic = true })
hl(0, "FzfLuaBorder", { link = "FloatBorder" })
hl(0, "MarkviewCode", { bg = base16.base02 })
hl(0, "SnacksIndent", { fg = base16.base04 })
hl(0, "SnacksIndentScope", { fg = base16.base09 })
hl(0, "BlinkCmpDoc", { link = "pmenu" })
hl(0, "BlinkCmpDocBorder", { link = "pmenu" })
hl(0, "SnacksDashboardKey", { fg = base16.base04, bold = true })
hl(0, "SnacksDashboardHeader", { fg = shade(base16.base04, 10) })
hl(0, "SnacksDashboardDir", { fg = shade(base16.base04, -10) })
hl(0, "WhichKeyBorder", { fg = base16.base0F })
hl(0, "WhichKeyTitle", { fg = base16.base06 })
hl(0, "MultiCursorCursor", { link = "Cursor" })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MarkviewCheckboxUnchecked", { fg = base16.base07 })
hl(0, "TreesitterContext", { bg = shade(base16.base03, -15) })
hl(0, "TreesitterContextSeparator", { fg = base16.base09, bg = shade(base16.base03, -15) })
