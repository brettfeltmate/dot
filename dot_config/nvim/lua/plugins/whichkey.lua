return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			-- AI
			-- { "<leader>a", group = "AI", icon = "󱜸" },
			-- { "<leader>at", icon = "󰔁" },
			-- { "<leader>an", icon = "󰎔" },
			-- { "<leader>az", icon = "󰆼" },
			-- { "<leader>ad", icon = "󰆽" },
			-- { "<leader>af", icon = "󰈈" },
			-- { "<leader>ac", icon = "󰭹" },

			-- Main mappings
			{ "<leader>c", icon = "󰍉" },
			{ "<leader>d", icon = "󰗩" },
			{ "<leader>f", icon = "󰱼" },
			{ "<leader>o", icon = "󰝰" },
			{ "<leader>p", icon = "󰍉" },
			{ "<leader>q", icon = "󰗼" },
			{ "<leader>r", icon = "󰺯" },
			{ "<leader>s", icon = "󰠮" },
			{ "<leader>u", icon = "󰕌" },
			{ "<leader>w", icon = "󰆓" },
			{ "<leader>y", icon = "" },

			-- Git
			{ "<leader>g", group = "Git", icon = "󰊢" },
			{ "<leader>gd", icon = "󰆽" },

			-- Git hunks
			{ "<leader>gh", group = "Hunk", icon = "󰦨" },
			{ "<leader>ghs", icon = "󰐕" },
			{ "<leader>ghu", icon = "󰍶" },
			{ "<leader>ghp", icon = "󰈈" },

			-- Git buffer
			{ "<leader>gb", group = "Buffer", icon = "󰓩" },
			{ "<leader>gbs", icon = "󰐕" },
			{ "<leader>gbu", icon = "󰍶" },
			{ "<leader>gbd", icon = "󰆽" },
			{ "<leader>gbh", icon = "󰋚" },
			{ "<leader>gbb", icon = "󰋗" },

			-- Git accept
			{ "<leader>ga", group = "Accept", icon = "󰄬" },
			{ "<leader>gab", icon = "󰄬" },
			{ "<leader>gac", icon = "󰆹" },
			{ "<leader>gai", icon = "󰋔" },

			-- Other groups
			{ "gd", group = "Debug", icon = "󰃤" },
			{ "m", group = "Haunt", icon = "" },
			{ "<localleader>", group = "Local" },
		})
		local o = {
			preset = "classic",
			sort = { "local", "alphanum" },
			win = {
				padding = { 0, 4 },
				height = { min = 2, max = 10 },
				border = "rounded",
				wo = { winblend = 0 },
			},
			icons = { separator = "|", group = "" },
			triggers = {
				{ "<auto>", mode = "nixsotc" },
				{ "m", mode = { "n", "v" } },
				{ "<localleader>", mode = { "n", "v" } },
			},
		}
		return o
	end,
}
