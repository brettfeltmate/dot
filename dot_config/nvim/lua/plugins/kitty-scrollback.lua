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
				after_paste_window_ready = vim.cmd("set nu rnu"),
			},
			paste_window = {
				winblend = 10,
				winopts_overrides = function()
					local r = vim.o.lines
					local h = 20
					return {
						border = "rounded",
						row = r - h,
						col = 0,
						height = h,
						width = vim.o.columns,
					}
				end,
				footer_winopts_overrides = function()
					return {
						border = "rounded",
						title = "",
						title_pos = "center",
					}
				end,
			},
		},
	},
	config = function(_, opts)
		require("kitty-scrollback").setup(opts)
	end,
}
