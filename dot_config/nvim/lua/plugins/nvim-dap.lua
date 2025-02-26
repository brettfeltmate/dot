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
