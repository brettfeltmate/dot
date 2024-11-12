return {
	"nvchad/showkeys",
	lazy = true,
	cmd = "ShowkeysToggle",
	opts = {
		show_count = true,
		position = "top-right",
		keyformat = {
			["<BS>"] = "󰁮 ",
			["<CR>"] = "󰘌",
			["<Space>"] = "󱁐",
			["<Up>"] = "󰁝",
			["<Down>"] = "󰁅",
			["<Left>"] = "󰁍",
			["<Right>"] = "󰁔",
			["<PageUp>"] = "",
			["<PageDown>"] = "",
			["<M>"] = "󰘵",
			["<A>"] = "󰘵",
			["<C>"] = "󰘴",
			["<S>"] = "󰘶",
		},
	},
}
