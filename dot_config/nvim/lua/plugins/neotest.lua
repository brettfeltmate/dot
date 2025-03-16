return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"mfussenegger/nvim-dap",
	},
	lazy = true,
	opts = {
		adapters = { "neotest-python" },
		floating = { max_height = 0.9, max_width = 0.9 },
		status = { virtual_text = true },
		output = { open_on_run = false },
		summary = { expand_errors = true },
		quickfix = { open = false },
	},
	config = function(_, opts)
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					-- Replace newline and tab characters with space for more compact diagnostics
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
		if opts.adapters then
			local adapters = {}
			for name, config in pairs(opts.adapters or {}) do
				if type(name) == "number" then
					if type(config) == "string" then
						config = require(config)
					end
					adapters[#adapters + 1] = config
				elseif config ~= false then
					local adapter = require(name)
					if type(config) == "table" and not vim.tbl_isempty(config) then
						local meta = getmetatable(adapter)
						if adapter.setup then
							adapter.setup(config)
						elseif adapter.adapter then
							adapter.adapter(config)
							adapter = adapter.adapter
						elseif meta and meta.__call then
							adapter = adapter(config)
						else
							error("Adapter " .. name .. " does not support setup")
						end
					end
					adapters[#adapters + 1] = adapter
				end
			end
			opts.adapters = adapters
		end

		require("neotest").setup(opts)
	end,
	-- stylua: ignore
}

-- map({ "n" }, L("na"), C("lua require('neotest').run.run(vim.fn.expand('%'))"), "All")
-- map({ "n" }, L("nn"), C("lua require('neotest').run.run()"), "Nearest")
-- map({ "n" }, L("nw"), C("lua require('neotest').watch.toggle()"), "Watch nearest")
-- map({ "n" }, L("nd"), C("lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})"), "All (dap)")
-- map({ "n" }, L("ns"), C("lua require('neotest').summary.toggle()"), "Summary (panel)")
-- map({ "n" }, L("np"), C("lua require('neotest').output_panel.toggle()"), "Output panel")
-- map(
-- 	{ "n" },
-- 	L("no"),
-- 	C(
-- 		"lua require('neotest').output.open({enter = true, auto_close=false, open_win = function() vim.cmd('tabnew') end, })"
-- 	),
-- 	"Output (tab)"
-- )
