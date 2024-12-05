if true then return {} end

return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1001,
		opts = { rocks = { "magick" }, },
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
        lazy = true,
		config = function()
			require("image").setup({
				backend = "kitty",
				kitty_method = "normal",
				integrations = {},
				max_width = nil,
				max_height = nil,
				max_width_window_percentage = nil,
				-- toggles images when windows are overlapped
				window_overlap_clear_enabled = false,
				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
				-- auto show/hide images when the editor gains/looses focus
				editor_only_render_when_focused = true,
				-- auto show/hide images in the correct tmux window
				-- In the tmux.conf add `set -g visual-activity off`
				tmux_show_only_in_active_window = true,
				-- render image files as images when opened
				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
			})
		end,
	},
	{ "HakonHarnes/img-clip.nvim", lazy = true },
}
