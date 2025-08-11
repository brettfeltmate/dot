return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>a", icon = "󰞋  ", group = "Avante...", mode = { "n", "x" } },

			{ "<leader>aa", icon = "󱜹  ", desc = "Ask", mode = { "n", "x" } },
			{ "<leader>aB", icon = "󱐏  ", desc = "Add buffers" },
			{ "<leader>ac", icon = "󱐒  ", desc = "Add current" },
			{ "<leader>ad", desc = "Debug mode" },
			{ "<leader>af", icon = "󰨻  ", desc = "Focus" },
			{ "<leader>ah", icon = "󱝖  ", desc = "History" },
			{ "<leader>an", icon = "󰻞  ", desc = "New", mode = { "n", "x" } },
			{ "<leader>ar", icon = "󱣲  ", desc = "Refresh" },
			{ "<leader>aR", icon = "󰳏  ", desc = "Repo map" },
			{ "<leader>as", icon = "󱠁  ", desc = "Autosuggest" },
			{ "<leader>aS", desc = "Stop" }, -- 
			{ "<leader>at", icon = "󱨦  ", desc = "Toggle" },
			{ "<leader>a?", icon = "󱄕  ", desc = "Models" },
			{ "<leader>ae", icon = "󱓙  ", desc = "edit", mode = "x" },

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
			{ "<leader>z", icon = "  " },

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
