return {
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		dependencies = {
			{
				"kevinhwang91/nvim-bqf",
				opts = {
					preview = {
						auto_preview = false,
						winblend = 0,
					},
				},
			},
		},
		opts = { highlight = { load_buffers = true } },
	},
	-- {
	-- 	"kevinhwang91/nvim-bqf",
	-- 	ft = "BufReadPre",
	-- 	opts = {
	-- 		preview = {
	-- 			auto_preview = false,
	-- 			winblend = 0,
	-- 		},
	-- 	},
	-- },
}
