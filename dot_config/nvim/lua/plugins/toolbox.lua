return {
	"DanWlker/toolbox.nvim",
	lazy = true,
	dependencies = "ibhagwan/fzf-lua",
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
				execute = "FzfLua files cwd=~/Projects",
				tags = { "search" },
			},
			{
				name = "klibs",
				execute = "FzfLua files cwd=~/Projects/Python/klibs",
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
					require("fzf-lua").files({
						prompt = "Images ❯ ",
						fd_opts = [[-I -e jpg -e png -e jpeg -e pdf]],
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
				name = "undos",
				execute = "lua Snacks.picker.undo()",
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
				execute = "FzfLua live_grep cwd=~/Projects",
				tags = { "grep" },
			},
			{
				name = "klibs",
				execute = "FzfLua live_grep cwd=~/Projects/python/klibs",
				tags = { "grep" },
			},
			{
				name = "help",
				execute = "lua require('fzf-lua').live_grep({ cwd = vim.fs.joinpath(vim.env.VIMRUNTIME, 'doc') })",
				tags = { "grep" },
			},
			{
				name = "reload",
				execute = "lua require('base46').load_all_highlights()",
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
				name = "flip",
				execute = function()
					-- Exit early if no splits exist
					if vim.fn.winnr("$") == 1 then
						vim.notify("No splits to flip", vim.log.levels.WARN)
						return
					end

					local initial_win = vim.fn.winnr()
					local is_horizontal = vim.fn.winwidth(0) > vim.fn.winheight(0)

					-- Try primary orientation flip
					vim.cmd("wincmd " .. (is_horizontal and "K" or "H"))

					-- If unsuccessful, try opposite orientation
					if initial_win == vim.fn.winnr() then
						vim.cmd("wincmd " .. (is_horizontal and "H" or "K"))
					end

					-- Recenter both windows
					local commands = { "wincmd p", "normal! zz", "wincmd p", "normal! zz" }
					for _, cmd in ipairs(commands) do
						vim.cmd(cmd)
					end
				end,
				tags = { "misc" },
			},
			{
				name = "scrollbind",
				execute = function()
					if not vim.g.scrollbindon then
						for i = 1, vim.fn.winnr("$") do
							vim.cmd(i .. "windo set scrollbind")
						end
						vim.g.scrollbindon = true
					else
						for i = 1, vim.fn.winnr("$") do
							vim.cmd(i .. "windo set scrollbind!")
						end
						vim.g.scrollbindon = false
					end
				end,
				tags = { "misc" },
			},
			-- {
			-- 	name = "all",
			-- 	execute = "lua require('neotest').run.run(vim.fn.expand('%'))",
			-- 	tags = { "test" },
			-- },
			-- {
			-- 	name = "nearest",
			-- 	execute = "lua require('neotest').run.run()",
			-- 	tags = { "test" },
			-- },
			-- {
			-- 	name = "watch",
			-- 	execute = "lua require('neotest').watch.toggle()",
			-- 	tags = { "test" },
			-- },
			-- {
			-- 	name = "summary",
			-- 	execute = "lua require('neotest').summary.toggle()",
			-- 	tags = { "test" },
			-- },
			-- {
			-- 	name = "panel",
			-- 	execute = "lua require('neotest').output_panel.toggle()",
			-- 	tags = { "test" },
			-- },
			-- {
			-- 	name = "output",
			-- 	execute = "lua require('neotest').output.open({enter = true, auto_close=false, open_win = function() vim.cmd('tabnew') end, })",
			-- 	tags = { "test" },
			-- },
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
			{
				name = "write",
				execute = function(obj_name)
					vim.cmd(
						"SlimeSend1 fwrite("
							.. "as.data.table("
							.. obj_name
							.. ", keep.rownames = TRUE)"
							.. ", file = './scratch.csv')"
					)
				end,
				input = true,
				tags = { "R" },
			},
			{
				name = "plots",
				execute = function()
					local r_ft = vim.bo.filetype == "r" or vim.bo.filetype == "rmd"

					local has_slime = vim.fn.exists("g:slime") == 1

					if r_ft and has_slime then
						vim.cmd(
							[[SlimeSend1 tryCatch(httpgd::hgd_browse(),error=function(e) {httpgd::hgd();httpgd::hgd_browse()})]]
						)
					end
				end,
				tags = { "R" },
			},
		},
	},
}
