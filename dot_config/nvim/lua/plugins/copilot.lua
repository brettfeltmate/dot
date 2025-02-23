return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
		opts = {
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<M-j>",
					prev = "<M-k>",
					dismiss = "<M-h>",
				},
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = true,
		cmd = {
			"CopilotChatToggle",
			"CopilotChatStop",
			"CopilotChatReset",
			"CopilotChatExplain",
			"CopilotChatFix",
			"CopilotChatDocs",
			"CopilotChatTests",
			"CopilotChatOptimize",
		},
		dependencies = { "zbirenbaum/copilot.lua" },
		branch = "main",
		build = "make tiktoken",
		opts = {
			model = "claude-3.5-sonnet",
			question_header = "~    User  ~  ",
			answer_header = "~    Copilot  ~  ",
			error_header = "~    ERROR  ~  ",
			show_folds = true,
			-- Default context to use
			-- -- 'buffers', 'buffer', 'files' or none
			-- -- (can be specified manually in prompt via #).
			context = nil,
			prompts = {
				Explain = {
					prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection.",
				},
				Review = {
					prompt = "/COPILOT_REVIEW Review the selected code.",
				},
				Fix = {
					prompt = "/COPILOT_GENERATE There is a problem in this code. Provide a fix and explanation.",
				},
				Optimize = {
					prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readability.",
				},
				Docs = {
					prompt = "/COPILOT_GENERATE Provide documentation for the selection.",
				},
				Tests = {
					prompt = "/COPILOT_GENERATE Generate tests for my code.",
				},
			},
			window = {
				layout = "float",
				relative = "win",
				width = math.floor(math.max(40, vim.api.nvim_win_get_width(0) * 0.4)),
				height = 1,
				row = 0,
				col = math.floor(math.max(40, vim.api.nvim_win_get_width(0) * 0.6)),
				title = "Copilot Chat",
				border = "rounded",
			},
			mappings = {
				complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<Tab>" },
				close = { normal = "q", insert = "<C-c>" },
				reset = { normal = "<C-l>", insert = "<C-l>" },
				submit_prompt = { normal = "<CR>", insert = "<C-s>" },
				accept_diff = { normal = "<C-y>", insert = "<C-y>" },
				yank_diff = { normal = "gy", register = '"' },
				show_diff = { normal = "gd" },
				show_info = { normal = "gp" },
				show_context = { normal = "gs" },
			},
		},
	},
}
