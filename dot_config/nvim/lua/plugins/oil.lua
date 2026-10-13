return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		watch_for_changes = true,
		preview_win = { preview_method = "scratch" },
	},
}
