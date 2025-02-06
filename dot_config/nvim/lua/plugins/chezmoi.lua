return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	cmd = "ChezFzf",
	config = function()
		require("chezmoi").setup({})
		local borders = { " ", "─", " ", " ", " ", "─", " ", " " }
		Fzf_Chezmoi = function()
			require("fzf-lua").fzf_exec(require("chezmoi.commands").list(), {

				file_icons = "mini",
				fzf_opts = { ["--layout"] = "reverse" },

				winopts = {
                    title = "Configs",
					border = borders,
					relative = "editor",
					row = 1,
					col = 0,
					backdrop = 99,
					width = 1,
					height = 0.35,
					treesitter = { enabled = true },
					preview = {
                        title = true,
						border = borders,
						horizontal = "right:65%",
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
