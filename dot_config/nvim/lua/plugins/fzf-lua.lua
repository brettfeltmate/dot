return {
	"ibhagwan/fzf-lua",
	lazy = true,
	cmd = "FzfLua",
	-- event = "BufRead",
	dependencies = { "echasnovski/mini.icons", "folke/trouble.nvim" },
	config = function()
		-- local trouble = require("trouble.sources.fzf").actions
		local quicker = require("quicker")
		local img_previewer
		for _, v in ipairs({
			{ cmd = "ueberzug", args = {} },
			{ cmd = "chafa", args = { "{file}", "--format=symbols" } },
			{ cmd = "viu", args = { "-b" } },
		}) do
			if vim.fn.executable(v.cmd) == 1 then
				img_previewer = vim.list_extend({ v.cmd }, v.args)
				break
			end
		end
		require("fzf-lua").setup({
			-- fzf_bin = "fzf-tmux",
			fzf_opts = { ["--layout"] = "reverse" },
			winopts = {
				relative = "editor",
				row = 1,
				col = 0,
				backdrop = 100,
				fullscreen = false,
				width = 1,
				height = 0.50,
				preview = {
					title_pos = "center",
					horizontal = "right:60%",
					vertical = "up:60%",
					layout = "horizontal",
				},
			},
			files = {
				file_icons = "mini",
			},
			keymap = {
				builtin = {
					true,
					["<C-Esc>"] = "hide",
				},
			},
			actions = {
				files = {
					true,
					["alt-t"] = quicker.open,
				},
			},
			previewers = {
				builtin = {
					extensions = {
						["png"] = img_previewer,
						["jpg"] = img_previewer,
						["jpeg"] = img_previewer,
						["gif"] = img_previewer,
						["webp"] = img_previewer,
					},
					ueberzug_scaler = "fit_contain",
				},
			},
		})
		require("fzf-lua").register_ui_select()
	end,
}
