return {
	"DanWlker/toolbox.nvim",
    lazy = true,
	opts = {
		commands = {
			{
				name = "Search share",
				execute = "FzfLua files cwd=~/.local/share",
			},
            {
                name = "Search home",
                execute = "FzfLua files cwd=~/",
            },
            {
                name = "Search downloads",
                execute = "FzfLua files cwd=~/Downloads",
            },
            {
                name = "Search documents",
                execute = "FzfLua files cwd=~/Documents",
            },
			{
				name = "Grep share",
				execute = "FzfLua live_grep cwd=~/.local/share",
			},
            {
                name = "Grep home",
                execute = "FzfLua live_grep cwd=~/",
            },
            {
                name = "Grep downloads",
                execute = "FzfLua live_grep cwd=~/Downloads",
            },
            {
                name = "Grep documents",
                execute = "FzfLua live_grep cwd=~/Documents",
            },
			{
				name = "Reload scheme",
				execute = "lua require('base46').load_all_highlights()",
			},
            {
                name = "Colorschemes",
                execute = "lua require('nvchad.themes').open()"
            },
            {
                name = "Cmds",
                execute = "FzfLua commands",
            },
            {
                name ="Noice",
                execute = "NoiceAll",
            },
			{
				name = "Copy relative",
				execute = function()
					local path = vim.fn.expand("%")
					vim.fn.setreg("+", path)
				end,
			},
			{
				name = "Copy absolute",
				execute = function()
					local path = vim.fn.expand("%:p")
					vim.fn.setreg("+", path)
				end,
			},
		},
	},
}
