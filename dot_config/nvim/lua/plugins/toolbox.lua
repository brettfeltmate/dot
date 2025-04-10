return {
	"DanWlker/toolbox.nvim",
	lazy = true,
	dependencies = { "ibhagwan/fzf-lua", "nvzone/volt" },
	opts = {
		commands = {
			{
				name = "local",
				execute = "FzfLua files cwd=~/.local",
				tags = { "search" },
			},
			{
				name = "home",
				execute = "FzfLua files cwd=~/",
				tags = { "search" },
			},
			{
				name = "downloads",
				execute = "FzfLua files cwd=~/Downloads",
				tags = { "search" },
			},
			{
				name = "documents",
				execute = "FzfLua files cwd=~/Documents",
				tags = { "search" },
			},
			{
				name = "projects",
				execute = "FzfLua files cwd=~/projects",
				tags = { "search" },
			},
			{
				name = "klibs",
				execute = "FzfLua files cwd=~/projects/python/klibs",
				tags = { "search" },
			},
			{
				name = "help",
				execute = "FzfLua helptags",
				tags = { "search" },
			},
			{
				name = "builtin",
				execute = "FzfLua builtin",
				tags = { "search" },
			},
			{
				name = "config",
				execute = "ChezFzf",
				tags = { "search" },
			},
			{
				name = "images",
				execute = function()
					require("snacks").picker.files({
						finder = "files",
						format = "file",
						cmd = "fd",
						args = { "-I", "-e", "jpg", "-e", "png", "-e", "jpeg", "-e", "pdf" },
						layout = "left",
					})
				end,
				tags = { "search" },
			},
			{
				name = "scratch",
				execute = "lua Snacks.scratch.select()",
				tags = { "search" },
			},
			{
				name = "working",
				execute = "FzfLua files",
				tags = { "search" },
			},
			{
				name = "yanks",
				exectue = "YankyRingHistory",
				tags = { "search" },
			},
			{
				name = "undos",
				exectue = "lua Snacks.picker.undo()",
				tags = { "search" },
			},
			{
				name = "oldfiles",
				execute = "FzfLua oldfiles",
				tags = { "search" },
			},
			{
				name = "local",
				execute = "FzfLua live_grep cwd=~/.local",
				tags = { "grep" },
			},
			{
				name = "working",
				execute = "FzfLua live_grep",
				tags = { "grep" },
			},
			{
				name = "home",
				execute = "FzfLua live_grep cwd=~/",
				tags = { "grep" },
			},
			{
				name = "downloads",
				execute = "FzfLua live_grep cwd=~/Downloads",
				tags = { "grep" },
			},
			{
				name = "documents",
				execute = "FzfLua live_grep cwd=~/Documents",
				tags = { "grep" },
			},
			{
				name = "projects",
				execute = "FzfLua live_grep cwd=~/projects",
				tags = { "grep" },
			},
			{
				name = "klibs",
				execute = "FzfLua live_grep cwd=~/projects/python/klibs",
				tags = { "grep" },
			},
			{
				name = "help",
				execute = "lua require('fzf-lua').live_grep({ cwd = vim.fs.joinpath(vim.env.VIMRUNTIME, 'doc') })",
				tags = { "grep" },
			},
            {
                name = "csvview",
                execute = "CsvViewToggle",
                tags = { "misc" },
            },
            {
                name = "tsvview",
                execute = "CsvViewToggle delimiter='\t'",
                tags = { "misc" },
            },
			{
				name = "reload",
				execute = "lua require('base46').load_all_highlights()",
				tags = { "misc" },
			},
			{
				name = "schemes",
				execute = function()
					require("nvchad.themes").open()
				end,
				tags = { "misc" },
			},
			{
				name = "scratch",
				execute = function(...)
					local opts = { ... }
					require("snacks").scratch.open(opts)
				end,
				require_input = true,
				tags = { "misc" },
			},
			{
				name = "triggers",
				execute = "lua MiniClue.enable_all_triggers()",
				tags = { "misc" },
			},
			{
				name = "news",
				execute = function()
					require("snacks").win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
						width = 0.6,
						height = 0.6,
					})
				end,
				tags = { "misc" },
			},
			{
				name = "plugin",
				execute = "Lazy load",
				input = true,
				tags = { "misc" },
			},
			{
				name = "marks",
				execute = "FzfLua marks",
				tags = { "misc" },
			},
			{
				name = "color",
				execute = "CccPick",
				tags = { "misc" },
			},
			{
				name = "all",
				execute = "lua require('neotest').run.run(vim.fn.expand('%'))",
				tags = { "test" },
			},
			{
				name = "nearest",
				execute = "lua require('neotest').run.run()",
				tags = { "test" },
			},
			{
				name = "watch",
				execute = "lua require('neotest').watch.toggle()",
				tags = { "test" },
			},
			{
				name = "summary",
				execute = "lua require('neotest').summary.toggle()",
				tags = { "test" },
			},
			{
				name = "panel",
				execute = "lua require('neotest').output_panel.toggle()",
				tags = { "test" },
			},
			{
				name = "output",
				execute = "lua require('neotest').output.open({enter = true, auto_close=false, open_win = function() vim.cmd('tabnew') end, })",
				tags = { "test" },
			},
			{
				name = "definitions",
				execute = "FzfLua lsp_definitions",
				tags = { "lsp" },
			},
			{
				name = "references",
				execute = "FzfLua lsp_references",
				tags = { "lsp" },
			},
			{
				name = "errors",
				execute = "FzfLua diagnostics_document severity_only='Error'",
				tags = { "lsp" },
			},
			{
				name = "warnings",
				execute = "FzfLua diagnostics_document severity_only='Warning'",
				tags = { "lsp" },
			},
			{
				name = "hints",
				execute = "FzfLua diagnostics_document severity_only='Hint'",
				tags = { "lsp" },
			},
			{
				name = "actions",
				execute = "FzfLua lsp_code_actions",
				tags = { "lsp" },
			},
			{
				name = "symbols",
				execute = "FzfLua lsp_document_symbols",
				tags = { "lsp" },
			},
			{
				name = "workspace",
				execute = "FzfLua lsp_workspace_symbols",
				tags = { "lsp" },
			},
		},
	},
}
