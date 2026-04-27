return {
	"TheNoeTrevino/haunt.nvim",
	event = "BufReadPre",
	opts = {
		sign = "󱙝",
		sign_hl = "HauntSign",
		virt_text_hl = "HauntAnnotation",
		annotation_prefix = " 󱙝 ",
		line_hl = nil,
		virt_text_pos = "eol",
	},
}
