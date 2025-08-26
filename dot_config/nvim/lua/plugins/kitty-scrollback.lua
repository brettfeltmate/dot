return {
	"mikesmithgh/kitty-scrollback.nvim",
	lazy = true,
	-- cmd = {
	-- 	"KittyScrollbackGenerateKittens",
	-- 	"KittyScrollbackCheckHealth",
	-- 	"KittyScrollbackGenerateCommandLineEditing",
	-- },
	event = { "User KittyScrollbackLaunch" },
	version = "*", -- latest stable version, may have breaking changes if major version changed
	opts = {
		callbacks = {
			after_paste_window_ready = function()
				vim.cmd("set nu rnu")
			end,
		},
		paste_window = {
			winblend = 0,
			winopts_override = {
				relative = "editor",
				row = 1,
				col = 0,
				anchor = "SW",
				width = 40,
				height = 10,
				border = "rounded",
			},
			footer_winopts_overrides = {
				border = "rounded",
				title = "",
			},
		},
	},
}
