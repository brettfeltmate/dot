return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			-- AI
			{ "<leader>a", group = "AI", icon = "󱜸  " },
			{ "<leader>d", icon = "󰗩  " },
			{ "<leader>g", group = "Git", icon = "  " },
			{ "<leader>gh", group = "Hunk", icon = "󰦨  " },
			{ "<leader>gb", group = "Buffer", icon = "  " },
			{ "<leader>ga", group = "Accept", icon = "  " },
			{ "<leader>gd", icon = "  " },

			{ "<leader>r", icon = "󰺯  " },
			{ "<leader>o", icon = "  " },
			{ "<leader>p", icon = "  " },
			{ "<leader>s", icon = "  " },
			{ "<leader>w", icon = "  " },
			{ "gd", group = "Debug", icon = "  " },
		})
		local o = {
			preset = "classic",
			sort = { "alphanum" },
			win = {
				padding = { 0, 4 },
				height = { min = 2, max = 10 },
				border = "rounded",
				wo = { winblend = 0 },
			},
			icons = { separator = "|", group = "" },
		}
		return o
	end,
}
