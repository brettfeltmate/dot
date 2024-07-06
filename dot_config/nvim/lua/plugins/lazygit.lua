return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = {
		{ "<leader>go", "<cmd>LazyGit<cr>", "open (cwd)" },
	},
	dependencies = { "nvim-lua/plenary.nvim" },
}
