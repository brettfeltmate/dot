return {
	{ "nvim-neotest/nvim-nio", lazy = true },
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			{ "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
		},
		opts = {
			configurations = {
				python = { justMyCode = false },
			},
		},
		config = function(_, opts)
			require("nvim-dap-virtual-text").setup() ---@diagnostic disable-line
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", "<leader>d" .. lhs, rhs, { desc = desc })
			end

			dofile(vim.g.base46_cache .. "dap")

			map("k", function()
				require("dap").step_out()
			end, "Step out")

			map("j", function()
				require("dap").step_into()
			end, "Step into")

			map("l", function()
				require("dap").step_over()
			end, "Step over")

			map("b", function()
				require("dap").toggle_breakpoint()
			end, "Breakpoint")

			map("d", function()
				require("dap").continue()
			end, "Start/continue")

			map("q", function()
				require("dap").terminate()
			end, "Quit")

			map("r", function()
				require("dap").repl.open()
			end, "REPL")

			map("h", function()
				require("dap.ui.widgets").hover()
			end, "Hover")

			map("p", function()
				require("dap.ui.widgets").preview()
			end, "Preview")

			map("f", function()
				require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
			end, "Frames")

			map("s", function()
				require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
			end, "Scopes")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {
			layouts = {
				{ elements = { "scopes", "repl" }, position = "bottom", size = 15 },
				{ elements = { "console" }, position = "right", size = 0.4 },
			},
		},
		config = function(_, opts)
			require("dapui").setup(opts)

			local listener = require("dap").listeners
			listener.after.event_initialized["dapui_config"] = function()
				require("dapui").open()
			end
			-- listener.before.event_terminated["dapui_config"] = function()
			-- 	require("dapui").close()
			-- end
			-- listener.before.event_exited["dapui_config"] = function()
			-- 	require("dapui").close()
			-- end

			vim.keymap.set("n", "<leader>du", function()
				require("dapui").toggle()
			end, { desc = "UI" })
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		ft = { "python" },
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
				.. "/venv/bin/python3"
			require("dap-python").setup(debugpyPythonPath, {}) ---@diagnostic disable-line: missing-fields
		end,
	},
}
