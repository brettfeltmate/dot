return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>a", icon = "󰞋  ", group = "OpenCode", mode = { "n", "x" } },

			{ "<leader>c", icon = "  " },
			{ "<leader>d", icon = "󰗩  " },
			{ "<leader>e", icon = "  " },
			{ "<leader>f", icon = "󰥨  " },
			{ "<leader>g", icon = "󰺯  " },
			{ "<leader>i", icon = "󰥷  " },
			{ "<leader>o", icon = "  " },
			{ "<leader>q", icon = "󰅗  " },
			{ "<leader>s", icon = "  " },
			{ "<leader>x", icon = "󰜎  " },
			{ "<leader>n", icon = "  " },

			{ "<leader>.", icon = "󰊢  ", group = "Hunk...", mode = { "n", "x" } },
			{ "<leader>.s", icon = "  ", mode = { "n", "x" } },
			{ "<leader>.r", icon = "  ", mode = { "n", "x" } },
			{ "<leader>.p", icon = "󰕚  " },
			{ "<leader>.i", icon = "  " },
			{ "<leader>.d", icon = "  " },
			{ "<leader>.q", icon = "  " },

			{ "gd", group = "Debug", icon = "  " },
		})
		local o = {
			preset = "helix",
			win = {
				padding = { 0, 1 },
				wo = { winblend = 0 },
			},
			icons = {
				-- breadcrumb = "󱁐 ",
				separator = "",
				group = "",
			},
		}
		return o
	end,
	keys = {
		{
			"<localleader>",
			function()
				require("which-key").show({ global = false })
			end,
		},
	},
}
