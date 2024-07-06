return {
	"ahmedkhalf/project.nvim",
	lazy = false,
	config = function()
		require("project_nvim").setup({
			patterns = {
				".git",
				"_darcs",
				".hg",
				".bzr",
				".svn",
				"Makefile",
				"package.json",
				".rproj",
				".here",
				"experiment.py",
			},
		})
	end,
}
