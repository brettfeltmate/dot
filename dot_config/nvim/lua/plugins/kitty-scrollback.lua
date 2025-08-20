return {
	"mikesmithgh/kitty-scrollback.nvim",
	lazy = true,
	cmd = {
		"KittyScrollbackGenerateKittens",
		"KittyScrollbackCheckHealth",
		"KittyScrollbackGenerateCommandLineEditing",
	},
	event = { "User KittyScrollbackLaunch" },
	version = "*", -- latest stable version, may have breaking changes if major version changed
	opts = {
		{
			callbacks = {
				after_paste_window_ready = function()
					vim.cmd("set nu rnu")
				end,
			},
			paste_window = {
				winblend = 0,
				footer_winopts_overrides = function()
					return {
						border = "rounded",
						title = "",
					}
				end,
			},
		},
	},
	config = function(_, opts)
		require("kitty-scrollback").setup(opts)
	end,
}
