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
hl(0, "MarkviewCode", { bg = base30.one_bg })
hl(0, "SnacksIndent", { fg = base16.base04 })
hl(0, "SnacksIndentScope", { fg = base30.line })
hl(0, "SnacksDashboardKey", { fg = base16.base04, bold = true })
hl(0, "SnacksDashboardHeader", { fg = shade(base16.base04, 10) })
hl(0, "SnacksDashboardDir", { fg = shade(base16.base04, -10) })
hl(0, "WhichKeyBorder", { fg = shade(base16.base09, -20), bg = base30.one_bg })
hl(0, "WhichKeyTitle", { fg = base16.base07 })
hl(0, "MultiCursorCursor", { link = "Cursor" })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MarkviewCheckboxUnchecked", { fg = base16.base07 })
hl(0, "TreesitterContext", { bg = base30.one_bg })
hl(0, "TreesitterContextSeparator", { fg = shade(base16.base03, 20), bg = base30.one_bg })
hl(0, "AvanteSidebarNormal", { bg = base30.one_bg })
hl(0, "AvantePromptInputBorder", { link = "FloatBorder" })
hl(0, "LeapBackdrop", { bg = shade(base16.base03, -5), fg = base16.base04 })
hl(0, "LeapLabelDimmed", { bg = shade(base16.base03, -5), fg = base16.base09 })
hl(0, "FlashMatch", { link = "Visual" })
hl(0, "BlinkCmpMenu", { bg = base30.black2 })
hl(0, "BlinkCmpMenuBorder", { bg = base30.black2, fg = base16.base07 })
hl(0, "BlinkCmpDoc", { bg = base30.black2 })
hl(0, "BlinkCmpDocBorder", { bg = base30.black2, fg = base16.base07 })
hl(0, "BlinkCmpGhostText", { fg = base16.base04 })
hl(0, "BlinkCmpSignatureHelp", { bg = base30.black2 })
hl(0, "BlinkCmpSignatureHelpBorder", { bg = "none", fg = base16.base07 })
hl(0, "BlinkCmpSignatureHelpActiveParameter", { fg = base16.base07, bold = true })
hl(0, "NoiceCmdlinePopupBorder", { fg = base16.base07, bg = base30.black2 })
hl(0, "NoiceCmdlinePopupTitle", { fg = base16.base07, bg = base30.black2 })
