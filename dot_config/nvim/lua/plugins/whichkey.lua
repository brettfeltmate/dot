return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			-- { ",", icon = "󰸫  ", group = "Local..." },
			{ "<leader>b", icon = "  " },
			-- { "<leader>c", icon = "  " },
			{ "<leader>d", icon = "󰗩  " },
			{ "<leader>t", icon = "  " },
			{ "<leader>o", icon = "  " },
			{ "<leader>s", icon = "󰥨  " },
			{ "<leader>w", icon = "  " },
			{ "<leader>g", icon = "󰺯  " },
			{ "<leader>q", icon = "󰅗  " },
			{ "<leader>z", icon = "󰘖  " },

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

			{ "<leader>,", icon = "󱃗  ", group = "Cmds..." },
			{ "<leader>,b", icon = "󰑮  " },
			{ "<leader>,d", icon = "󰜎  " },
			{ "<leader>,f", icon = "󰁨  " },
			{ "<leader>,n", icon = "󰊢  " },
			{ "<leader>,q", icon = "  " },
			{ "<leader>,r", icon = "󰑕  " },
			{ "<leader>,s", icon = "  " },
			{ "<leader>,w", icon = "  " },

			{ "<leader>.", icon = "󰻬  ", group = "Utils...", mode = { "n", "x" } },
			{ "<leader>.c", icon = "  " },
			{ "<leader>.e", icon = "  " },
			{ "<leader>.f", icon = "󰦭  " },
			{ "<leader>.g", icon = "󰺯  " },
			{ "<leader>.i", icon = "󰥷  " },
			{ "<leader>.r", icon = "󰏙  " },
			{ "<leader>.s", icon = "󰥨  " },
			{ "<leader>.t", icon = "󱇻  " },
			{ "<leader>.u", icon = "  " },
			{ "<leader>.n", icon = "  " },

			{ "<leader>.h", icon = "󰊢  ", group = "Hunk...", mode = { "n", "x" } },
			{ "<leader>.hs", icon = "  ", mode = { "n", "x" } },
			{ "<leader>.hr", icon = "  ", mode = { "n", "x" } },
			{ "<leader>.hp", icon = "󰕚  " },
			{ "<leader>.hi", icon = "  " },
			{ "<leader>.hd", icon = "  " },
			{ "<leader>.hq", icon = "  " },
			{ "<leader>.hh", icon = "  " },

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
