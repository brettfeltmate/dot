return {
	"sudo-tee/opencode.nvim",
	lazy = true,
	opts = {
		preferred_picker = "snacks",
		preferred_completion = "blink",
		default_global_keymaps = false,
		default_mode = "plan",
		keymap = {
			editor = {}, -- All editor keymaps disabled - now defined in keymaps.lua
			input_window = {
				["<cr>"] = { "submit_input_prompt", mode = { "n", "i" } },
				["<esc>"] = { "close" },
				["<C-c>"] = { "cancel" },
				["~"] = { "mention_file", mode = "i" },
				["@"] = { "mention", mode = "i" },
				["/"] = { "slash_commands", mode = "i" },
				["#"] = { "context_items", mode = "i" },
				["<M-v>"] = { "paste_image", mode = "i" },
				["<C-i>"] = { "focus_input", mode = { "n", "i" } },
				["<Tab>"] = { "toggle_pane", mode = { "n", "i" } },
				["<up>"] = { "prev_prompt_history", mode = { "n", "i" } },
				["<down>"] = { "next_prompt_history", mode = { "n", "i" } },
				["<M-m>"] = { "switch_mode" },
			},
			output_window = {
				["<esc>"] = { "close" },
				["<C-c>"] = { "cancel" },
				["]]"] = { "next_message" },
				["[["] = { "prev_message" },
				["<Tab>"] = { "toggle_pane", mode = { "n", "i" } },
				["i"] = { "focus_input", "n" },
				["<leader>aS"] = { "select_child_session" },
				["<leader>aD"] = { "debug_message" },
				["<leader>aO"] = { "debug_output" },
				["<leader>ads"] = { "debug_session" },
			},
		},
	},
	config = function(_, opts)
		require("opencode").setup(opts)
	end,
}
