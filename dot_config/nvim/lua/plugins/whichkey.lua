return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>b", icon = "  " },
			{ "<leader>c", icon = "  " },
			{ "<leader>d", icon = "󰗩  " },
			{ "<leader>t", icon = "  " },
			{ "<leader>o", icon = "  " },
			{ "<leader>s", icon = "󰥨  " },
			{ "<leader>w", icon = "  " },
			{ "<leader>g", icon = "󰺯  " },
			{ "<leader>q", icon = "󰅗  " },
			{ "<leader>z", icon = "󰘖  " },

			{ "<leader>,", group = "Cmds" },
			{ "<leader>,b", icon = "󰑮  " },
			{ "<leader>,d", icon = "󰜎  " },
			{ "<leader>,f", icon = "󰁨  " },
			{ "<leader>,n", icon = "󰊢  " },
			{ "<leader>,q", icon = "  " },
			{ "<leader>,r", icon = "󰑕  " },
			{ "<leader>,s", icon = "  " },
			{ "<leader>,w", icon = "  " },

			{ "<leader>.", group = "Util" },
			{ "<leader>.c", icon = "  " },
			{ "<leader>.e", icon = "  " },
			{ "<leader>.f", icon = "󰦭  " },
			{ "<leader>.g", icon = "󰺯  " },
			{ "<leader>.i", icon = "󰥷  " },
			{ "<leader>.r", icon = "󰏙  " },
			{ "<leader>.s", icon = "󰥨  " },
			{ "<leader>.t", icon = "󱇻  " },
			{ "<leader>.u", icon = "  " },

			{ "gd", group = "Debug", icon = "  " },
		})
		local o = {
			preset = "helix",
			win = {
				padding = { 0, 1 },
				wo = { winblend = 0 },
			},
		}
		return o
	end,
}
