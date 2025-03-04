return {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = {
		"BufReadPre " .. vim.fn.expand "~" .. "/Documents/Obsidian/*.md",
		"BufNewFile " .. vim.fn.expand "~" .. "/Documents/Obsidian/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"oflisback/obsidian-bridge.nvim",
        "oxy2dev/markview.nvim",
	},
	opts = {
		workspaces = { { name = "Obsidian", path = "~/Documents/Obsidian" } },
		completion = { nvim_cmp = false },
		new_notes_location = "current_dir",
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
	},
}
