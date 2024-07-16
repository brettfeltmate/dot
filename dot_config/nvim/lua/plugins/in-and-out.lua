return {
	{
		"declancm/cinnamon.nvim",
		event = "BufReadPost",
		config = function()
			require("cinnamon").setup({
				keymaps = { basic = true, extra = true },
				options = { mode = "cursor" },
			})
		end,
	},
	{
		"arnamak/stay-centered.nvim",
		event = "BufReadPost",
		config = function()
			require("stay-centered").setup({
				enabled = false,
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "BufReadPost",
		config = function()
			require("flash").setup({
				label = {
					rainbow = { enabled = true, shade = 5 },
				},
			})
		end,
	},
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				manual_mode = true,
				patterns = {
					".git",
					"_darcs",
					".hg",
					".bzr",
					".svn",
					"Makefile",
					"package.json",
					"Cargo.toml",
					"go.mod",
					".here",
					"experiment.py",
				},
			})
		end,
	},
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		config = function()
			require("smart-splits").setup()
		end,
	},
}
