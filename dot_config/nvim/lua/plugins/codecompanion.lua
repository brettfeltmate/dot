return {
	"olimorris/codecompanion.nvim",
    lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			chat = {
				adapter = "anthropic",
				roles = {
					---@type string|fun(adapter: CodeCompanion.Adapter): string
					llm = function(adapter)
						return "~ CodeCompanion[" .. adapter.formatted_name .. "] ~"
					end,
					---@type string
					user = "~    User  ~  ",
				},
			},
			inline = { adapter = "anthropic" },
		},
		adapters = {
			anthropic = function()  -- Changed from copilot to anthropic to match the strategy adapter
				return require("codecompanion.adapters").extend("anthropic", {
					schema = { model = { default = "claude-3-sonnet" } },  -- Updated to latest Claude model
				})
			end,
		},
		display = {
			chat = {
				intro_message = "CodeCompanion Chat (Press ? for options)",
				show_header_separator = false,
				show_references = true,
				show_settings = false,
				show_token_count = true,
				start_in_insert_mode = false,
				window = {
					layout = "float",
					relative = "editor",  -- Changed to editor for consistent positioning
					width = math.floor(math.max(40, vim.api.nvim_win_get_width(0) * 0.4)),
					height = 1,
					row = 0,
					col = math.floor(math.max(40, vim.api.nvim_win_get_width(0) * 0.6)),
					title = "CodeCompanion",
					border = "rounded",
					opts = {
						cursorline = true,
						winblend = 10,  -- Added slight transparency
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",  -- Added explicit highlighting
					},
				},
			},
		},
	},
}
