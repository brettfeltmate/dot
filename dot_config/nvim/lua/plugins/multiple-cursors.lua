return {
	"brenton-leighton/multiple-cursors.nvim",
	event = "BufReadPre",
	version = "*", -- Use the latest tagged version
	opts = {
		pre_hook = function()
			vim.cmd("Lazy load mini.move")
			vim.g.minipairs_disable = true
			require("nvim-autopairs").disable()
			require("cmp").setup({ enabled = false })
		end,
		post_hook = function()
			vim.g.minipairs_disable = false
			require("nvim-autopairs").enable()
			require("cmp").setup({ enabled = true })
		end,
		custom_key_maps = {
			{
				"n",
				{ "<A-k>", "<A-Up>" },
				function()
					MiniMove.move_line("up")
				end,
			},
			{
				"n",
				{ "<A-j>", "<A-Down>" },
				function()
					MiniMove.move_line("down")
				end,
			},
			{
				"n",
				{ "<A-h>", "<A-Left>" },
				function()
					MiniMove.move_line("left")
				end,
			},
			{
				"n",
				{ "<A-l>", "<A-Right>" },
				function()
					MiniMove.move_line("right")
				end,
			},

			{
				"x",
				{ "<A-k>", "<A-Up>" },
				function()
					MiniMove.move_selection("up")
				end,
			},
			{
				"x",
				{ "<A-j>", "<A-Down>" },
				function()
					MiniMove.move_selection("down")
				end,
			},
			{
				"x",
				{ "<A-h>", "<A-Left>" },
				function()
					MiniMove.move_selection("left")
				end,
			},
			{
				"x",
				{ "<A-l>", "<A-Right>" },
				function()
					MiniMove.move_selection("right")
				end,
			},
		},
	}, -- This causes the plugin setup function to be called
}
