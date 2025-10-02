return {
	"dmtrKovalenko/fff.nvim",
	build = "cargo build --release",
	opts = {
		prompt = "Query: ",
		title = "Results",
		layout = { height = 0.85, width = 1 },
		hl = { normal = "NormalFloat" },
	},
	lazy = true,
	cmd = "FFFFind",
}
