return {
	"xvzc/chezmoi.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	cmd = "ChezFzf",
	config = function()
		require("chezmoi").setup({})
		Fzf_Chezmoi = function()
			require("fzf-lua").fzf_exec(require("chezmoi.commands").list(), {
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
