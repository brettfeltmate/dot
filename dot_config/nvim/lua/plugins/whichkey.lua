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

			{ "<leader>,", group = "Utils", icon = "  " },
			{ "<leader>,d", icon = "󰜎  " },
			{ "<leader>,b", icon = "󰑮  " },
			{ "<leader>,f", icon = "󰁨  " },
			{ "<leader>,g", icon = "󰊢  " },
			{ "<leader>,h", icon = "  " },
			{ "<leader>,l", icon = "  " },
			{ "<leader>,q", icon = "  " },
			{ "<leader>,r", icon = "  " },
			{ "<leader>,s", icon = "  " },
			{ "<leader>,w", icon = "󰺴  " },

			{ "<leader>.", group = "Tools", icon = "󰹈  " },
			{ "<leader>.s", icon = "󰥩  " },
			{ "<leader>.g", icon = "󰺯  " },
			{ "<leader>.l", icon = "󱃖  " },
			{ "<leader>.m", icon = "  " },
			-- { "<leader>.t", icon = "󰙨 " },
			{ "<leader>.r", icon = "  " },

			{ "gd", group = "Debug", icon = "  " },
		})
		local o = {
			preset = "helix",
			win = {
                padding = { 0, 1 },
                wo = { winblend = 0 }
            },
			-- layout = { width = { min = 5 } },
		}
		return o
	end,
}
