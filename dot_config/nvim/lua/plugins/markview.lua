return {
	"OXY2DEV/markview.nvim",
	lazy = true,
	ft = { "markdown", "md", "rmd", "rmarkdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			modes = { "n", "i", "no", "c" },
			hybrid_modes = { "i" },
			headings = presets.headings.glow_labels,
			checkboxes = {
				checked = { text = "  " },
				unchecked = { text = "  " },
				pending = { text = " 󰡖 " },
			},
			callbacks = {
				on_enable = function(_, win)
					vim.wo[win].conceallevel = 2
					vim.wo[win].concealcursor = "nc"
					-- vim.cmd.colorscheme("desklight")
				end,
			},
		})
	end,
}
