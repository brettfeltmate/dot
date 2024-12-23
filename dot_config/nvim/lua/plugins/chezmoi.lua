return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	cmd = "ChezFzf",
	config = function()
		require("chezmoi").setup({})
		Fzf_Chezmoi = function()
			require("fzf-lua").fzf_exec(require("chezmoi.commands").list(), {
				file_icons = "mini",
				fzf_opts = { ["--layout"] = "reverse" },
				winopts = {
					title = "Chezmoi",
					title_pos = "left",
					preview = {
						title_pos = "left",
						horizontal = "right:70%",
						vertical = "down:70%",
						layout = "horizontal",
					},
				},
				preview = "bat --color=always ~/{}",
				actions = {
					["default"] = function(selected, opts)
						require("chezmoi.commands").edit({
							targets = { "~/" .. selected[1] },
							args = { "--watch" },
						})
					end,
				},
			})
		end
		vim.api.nvim_command("command! ChezFzf lua Fzf_Chezmoi()")
	end,
}
