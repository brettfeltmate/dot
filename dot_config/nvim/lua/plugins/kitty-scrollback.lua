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
			paste_window = {
				winblend = 10,
				winopts_overrides = function()
					-- local h = vim.o.lines - 5 -- TODO: magic number 3 for footer and 2 for border
                    local r = vim.o.lines
                    local h = 20
					return {
						border = "rounded",
						row = r - h,
						col = 0,
						-- height = h < 1 and 3 or h, -- TODO: magic number 3 for footer
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
