return {
	"ibhagwan/fzf-lua",
	lazy = true,
	config = function()
		require("fzf-lua").setup({
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
				backdrop = 20,
				fullscreen = true,
				preview = {
					title_pos = "left",
					horizontal = "right:70%",
					vertical = "down:70%",
					layout = "horizontal",
				},
			},
		})
		require("fzf-lua").register_ui_select()
	end,
}
