return {
	{
		"RaafatTurki/hex.nvim",
		lazy = true,
		cmd = "HexToggle",
		opts = {},
		config = function(_, opts)
			require("hex").setup(opts)
		end,
	},
	{
		"vetsE/hexamine.nvim",
		lazy = true,
		cmd = "Hexamine",
		opts = {},
		config = function(_, opts)
			require("hexamine").setup(opts)
		end,
	},
}
