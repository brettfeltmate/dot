return {
	"simifalaye/minibuffer.nvim",
	-- dependencies = {
	-- 	"dmtrKovalenko/fff.nvim",
	-- 	"echasnovski/mini.nvim",
	-- 	"folke/which-key.nvim",
	-- },
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	lazy = true,
	event = "VeryLazy",
	init = function()
		vim.ui.select = require("minibuffer.builtin.ui_select")
		vim.ui.input = require("minibuffer.builtin.ui_input")

		-- local picker_ui = require("fff.picker_ui")
		-- picker_ui.open = require("minibuffer.integrations.fff")
		--
		-- local pick_mb = require("minibuffer.integrations.mini-pick")
		-- local pick = require("mini.pick")
		-- pick.is_picker_active = pick_mb.is_picker_active
		-- pick.set_picker_items = pick_mb.set_picker_items
		-- pick.start = pick_mb.start

		-- local wk_mb = require("minibuffer.integrations.which-key")
		-- local wk_view = require("which-key.view")
		-- wk_view.show = wk_mb.show
		-- wk_view.hide = wk_mb.hide

		vim.keymap.set("n", "<C-;>", require("minibuffer.builtin.cmdline"))
		vim.keymap.set("n", "<leader>b", require("minibuffer.examples.buffers"))
	end,
}
