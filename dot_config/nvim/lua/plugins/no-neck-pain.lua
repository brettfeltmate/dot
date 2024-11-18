return {
	"shortcuts/no-neck-pain.nvim",
	lazy = true,
	cmd = "NoNeckPain",
	opts = {
		buffers = {
			scratchPad = { enabled = true, location = nil },
			bo = { filetype = "md" },
		},
	},
	config = function(_, opts)
		require("no-neck-pain").setup(opts)
	end,
}
