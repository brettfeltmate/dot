return {
	"yetone/avante.nvim",
	lazy = true,
	event = "BufRead",
	version = false,
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		-- "folke/snacks.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"ibhagwan/fzf-lua",
		"echasnovski/mini.icons",
		"oxy2dev/markview.nvim",
	},
	opts = {
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
		provider = "claude",
		---@alias Mode "agentic" | "legacy"
		mode = "legacy",
		auto_suggestions_provider = "copilot",
		behaviour = {
			auto_suggestions = false,
			support_paste_from_clipboard = true,
		},
		web_search_provider = {
			provider = "tavily",
			proxy = nil,
		},
		mappings = {
			--- @class AvanteConflictMappings
			diff = {
				ours = "co",
				theirs = "ct",
				all_theirs = "ca",
				both = "cb",
				cursor = "cc",
				next = "]d",
				prev = "[d",
			},
			suggestion = {
				accept = "<M-l>",
				next = "<M-j>",
				prev = "<M-k>",
				dismiss = "<M-h>",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			cancel = {
				normal = { "<C-e>", "<Esc>", "q" },
				insert = { "<C-e>" },
			},
			sidebar = {
				apply_all = "A",
				apply_cursor = "a",
				retry_user_request = "r",
				edit_user_request = "e",
				switch_windows = "<Tab>",
				reverse_switch_windows = "<S-Tab>",
				remove_file = "d",
				add_file = "@",
				close = { "<Esc>", "q" },
				close_from_input = { normal = "<Esc>", insert = "<C-e>" },
			},
		},
		input = {
			-- provider = "snacks",
			provider_opts = {
				-- Additional snacks.input options
				title = "Avante Input",
				icon = " ",
			},
		},
		hints = { enabled = true },
		windows = {
			width = 40,
			ask = { floating = true },
		},
		suggestion = {
			debounce = 600,
			throttle = 600,
		},
	},
}
