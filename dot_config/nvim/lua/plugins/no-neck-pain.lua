return {
	"shortcuts/no-neck-pain.nvim",
	lazy = true,
	cmd = "NoNeckPain",
    event = "BufReadPre",
	opts = {
        width = 140,
		buffers = {
			scratchPad = { enabled = true, location = nil },
			bo = { filetype = "md" },
		},
	},
	config = function(_, opts)
		require("no-neck-pain").setup(opts)
	end,
}
