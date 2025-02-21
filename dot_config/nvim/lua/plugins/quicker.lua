return {
	"stevearc/quicker.nvim",
	event = "BufRead",
    ft = { "qf" },
	opts = {
        highlight = { load_buffers = true },
        follow = { enabled = true },
    },
}
