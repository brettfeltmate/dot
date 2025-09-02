return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", icon = "  " },
			{ "<leader>d", icon = "󰗩  " },
			{ "<leader>e", icon = "  " },
			{ "<leader>s", icon = "󰥨  " },
			{ "<leader>g", icon = "󰺯  " },
			{ "<leader>h", icon = "  " },
			{ "<leader>j", icon = "  " },
			{ "<leader>m", icon = "󱧌  " },
			{ "<leader>o", icon = "  " },
			{ "<leader>w", icon = "  " },
			{ "<leader>r", icon = "󰑕  " },
			{ "<leader>q", icon = "󰅗  " },
			{ "<leader>x", icon = "󰜎  " },
			{ "<leader>y", icon = "  " },
			{ "<leader>z", icon = "  " },
			{ "gd", group = "Debug", icon = "  " },
		})
		local o = {
			preset = "helix",
			win = { padding = { 0, 1 }, wo = { winblend = 0 } },
			icons = { separator = "", group = "" },
		}
		return o
	end,
	-- keys = {
	-- 	{
	-- 		"<localleader>",
	-- 		function()
	-- 			require("which-key").show({ global = false })
	-- 		end,
	-- 	},
	-- },
}
