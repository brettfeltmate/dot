return {
	"DanWlker/toolbox.nvim",
	lazy = true,
	dependencies = { "ibhagwan/fzf-lua" },
	opts = {
		commands = {
			{
				name = "find local",
				execute = "FzfLua files cwd=~/.local",
			},
			{
				name = "grep local",
				execute = "FzfLua live_grep cwd=~/.local",
			},
			{
				name = "find home",
				execute = "FzfLua files cwd=~/",
			},
			{
				name = "grep home",
				execute = "FzfLua live_grep cwd=~/",
			},
			{
				name = "find downloads",
				execute = "FzfLua files cwd=~/Downloads",
			},
			{
				name = "grep downloads",
				execute = "FzfLua live_grep cwd=~/Downloads",
			},
			{
				name = "find documents",
				execute = "FzfLua files cwd=~/Documents",
			},
			{
				name = "grep documents",
				execute = "FzfLua live_grep cwd=~/Documents",
			},
			{
				name = "grep projects",
				execute = "FzfLua live_grep cwd=~/projects",
			},
			{
				name = "find projects",
				execute = "FzfLua files cwd=~/projects",
			},
            {
                name = "find klibs",
                execute = "FzfLua files cwd=~/projects/python/klibs",
            },
            {
                name = "grep klibs",
                execute = "FzfLua live_grep cwd=~/projects/python/klibs",
            },
			{
				name = "reload scheme",
				execute = "lua require('base46').load_all_highlights()",
			},
			{
				name = "load scheme",
				execute = "lua require('nvchad.themes').open()",
			},
		},
	},
}
