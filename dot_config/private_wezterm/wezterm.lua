local wezterm = require("wezterm")

local config = {}

config.term = "xterm-256color"

config.scrollback_lines = 50000

config.font = wezterm.font("Maple Mono NF Medium")

config.font_size = 15

config.line_height = 1.0

config.adjust_window_size_when_changing_font_size = false

config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Ashes (base16)" -- "vimbones" for light-mode

config.window_decorations = "RESIZE"

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

config.window_background_opacity = 0.9

config.text_background_opacity = 0.9

config.macos_window_background_blur = 25

config.use_dead_keys = false

config.enable_kitty_graphics = true

return config
