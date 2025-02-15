return {
	"DanWlker/toolbox.nvim",
	lazy = true,
	dependencies = { "ibhagwan/fzf-lua" },
	opts = {
        -- TODO: make use of weight property
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
			{
				name = "find scratch",
				execute = "lua Snacks.scratch.select()",
			},
			{
				name = "open scratch",
				execute = "lua Snacks.scratch.open()",
			},
			{
				name = "new scratch",
				execute = "lua Snacks.scratch()",
			},
            {
                name = "enable triggers",
                execute = "lua MiniClue.enable_all_triggers()"
            },
            {
                name = "open note",
                execute = "ObsidianOpen",
                input = true
            },
            {
                name = "new note",
                execute = "ObsidianNew",
                input = true
            },
            {
                name = "search notes",
                execute = "ObsidianSearch",
                input = true
            },
            {
                name = "search links",
                execute = "ObsidianLink",
                input = true
            },
            {
                name  = "new link",
                execute = "ObsidianLinkNew",
                input = true
            },
            {
                name = "rename note",
                execute = "ObsidianRename",
                input = true
            },
            {
                name = "search tags",
                execute = "ObsidianTags",
                input = true
            },
            {
                name = "new daily",
                execute = "ObsidianToday",
            },
            {
                name = "search dailies",
                execute = "ObsidianDailies",
            },
            {
                name = "note templates",
                execute = "ObsidianTemplate",
                input = true,
            },
            {
                name = "note from template",
                execute = "ObsidianNewFromTemplate",
                input = true,
            },
            {
                name = "note toc",
                execute = "ObsidianTOC",
            },

		},
	},
}
