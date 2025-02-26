return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat", lazy = true },
	event = "BufReadPre",
	opts = {
		equivalence_classes = { " \t\r\n", "({[", ")}]", "'\"`" },
		preview_filter = function(ch0, ch1, ch2)
			return not (ch1:match("%s") or ch0:match("%w") and ch1:match("%w") and ch2:match("%w"))
		end,
	},
    config = function(_, opts)
        require("leap").setup(opts)
        require("leap.user").set_repeat_keys('<enter>', '<backspace>')
    end,
}
