return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>,", group = "Utils" },
			{ "<leader>.", group = "Tools" },
		})
		local o = {
			preset = "helix",
			win = { wo = { winblend = 0 } },
			layout = { width = { max = 5 } },
		}
		return o
	end,
}
