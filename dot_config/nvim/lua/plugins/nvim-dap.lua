return {
	{ "nvim-neotest/nvim-nio", lazy = true },
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			{
				"nvim-neotest/nvim-nio",
				"theHamsta/nvim-dap-virtual-text",
			},
		},
		opts = {
			configurations = {
				python = { justMyCode = false },
			},
		},
		config = function()
			require("nvim-dap-virtual-text").setup() ---@diagnostic disable-line
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {
			layouts = {
				{
					elements = {
						{ "watches", size = 0.2 },
						{ "repl", size = 0.3 },
						{ "console", size = 0.5 },
					},
					position = "right",
					size = 0.4,
				},
			},
		},
		config = function(_, opts)
			require("dapui").setup(opts)
			local listener = require("dap").listeners
			listener.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
				.. "/venv/bin/python3"
			require("dap-python").setup(debugpyPythonPath, {}) ---@diagnostic disable-line: missing-fields
		end,
	},
}

-- map({ "n" }, L("dk"), function()
-- 	require("dap").step_out()
-- end, "Step out")
--
-- map({ "n" }, L("dj"), function()
-- 	require("dap").step_into()
-- end, "Step into")
--
-- map({ "n" }, L("dl"), function()
-- 	require("dap").step_over()
-- end, "Step over")
--
-- map({ "n" }, L("db"), function()
-- 	require("dap").toggle_breakpoint()
-- end, "Breakpoint")
--
-- map({ "n" }, L("dd"), function()
-- 	require("dap").continue()
-- end, "Start/continue")
--
-- map({ "n" }, L("dq"), function()
-- 	require("dap").terminate()
-- end, "Quit")
--
-- map({ "n" }, L("dr"), function()
-- 	require("dap").repl.open()
-- end, "REPL")
--
-- map({ "n" }, L("du"), function()
-- 	require("dapui").toggle()
-- end, "UI")
--
-- map({ "n" }, L("dh"), function()
-- 	require("dap.ui.widgets").hover()
-- end, "Hover")
--
-- map({ "n" }, L("dp"), function()
-- 	require("dap.ui.widgets").preview()
-- end, "Preview")
--
-- map({ "n" }, L("df"), function()
-- 	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
-- end, "Frames")
--
-- map({ "n" }, L("ds"), function()
-- 	require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
-- end, "Scopes")
