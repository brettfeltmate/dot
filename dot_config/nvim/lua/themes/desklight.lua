local M = {}

M.base30 = {
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
    green = "#66987c",
    vibrant_green = "#8ea592",
    nord_blue = "#707d91",
    blue = "#8996ab",
    seablue = "#80a0a4",
    yellow = "#cbae85",
    sun = "#ceb27d",
    purple = "#c0adda",
    dark_purple = "#ad93cd",
    teal = "#97bfa9",
    orange = "#dcb08d",
    cyan = "#9fbfb1",
    statusline_bg = "#322137",
    lightbg = "#6c5c6e",
    folder_bg = "#c9bba9",
}

M.base16 = {
	base00 = "#1A1320",
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
	base0B = "#a8a7a4",
	base0C = "#bf8080",
	base0D = "#9daba2",
	base0E = "#bfaa8c",
	base0F = "#b195b3",
}


M.type = "dark"

M = require("base46").override_theme(M, "desklight")

return M
