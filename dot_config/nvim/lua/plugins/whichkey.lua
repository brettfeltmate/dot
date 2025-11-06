return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", icon = "  " },
			{ "<leader>d", icon = "󰗩  " },
			{ "<leader>f", icon = "󰍉  " },
			{ "<leader>g", icon = "󰺯  " },
			{ "<leader>m", icon = "󱧌  " },
			{ "<leader>o", icon = "  " },
			{ "<leader>w", icon = "  " },
			{ "<leader>q", icon = "󰅗  " },
			{ "<leader>x", icon = "󰜎  " },
			{ "gd", group = "Debug", icon = "  " },
		})
		local o = {
			preset = "helix",
			win = { padding = { 0, 1 }, wo = { winblend = 0 } },
			icons = { separator = "", group = "" },
		}
		return o
	end,
}
