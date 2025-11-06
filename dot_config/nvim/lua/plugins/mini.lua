return {
	"echasnovski/mini.nvim",
	dependencies = { "simifalaye/minibuffer.nvim" },
	event = "VeryLazy",
	config = function()
		-- Core functionality modules
		require("mini.ai").setup() -- Enhanced text objects
		require("mini.basics").setup() -- Sensible defaults
		require("mini.comment").setup() -- Smart commenting
		require("mini.extra").setup()
		require("mini.pick").setup() -- Fuzzy picker
		local pick_mb = require("minibuffer.integrations.mini-pick")
		local pick = require("mini.pick")
		pick.is_picker_active = pick_mb.is_picker_active
		pick.set_picker_items = pick_mb.set_picker_items
		pick.start = pick_mb.start
		require("mini.pairs").setup() -- Auto-pairs
		require("mini.move").setup({ -- Move lines/selections
			mappings = {
				-- Move selection (visual mode)
				left = "<M-C-h>",
				right = "<M-C-l>",
				down = "<M-C-j>",
				up = "<M-C-k>",
				-- Move current line (normal mode)
				line_left = "<M-C-h>",
				line_right = "<M-C-l>",
				line_down = "<M-C-j>",
				line_up = "<M-C-k>",
			},
		})

		-- UI enhancement modules
		require("mini.icons").setup({
			file = {
				[".here"] = { glyph = "󰍎", hl = "MiniIconsPurple" },
				[".rproj"] = { glyph = "󰟔", hl = "MiniIconsCyan" },
			},
			filetype = {
				r = { glyph = "󰟔", hl = "MiniIconsCyan" },
				R = { glyph = "󰟔", hl = "MiniIconsCyan" },
				rmd = { glyph = "󰟔", hl = "MiniIconsCyan" },
				Rmd = { glyph = "󰟔", hl = "MiniIconsCyan" },
				csv = { glyph = "", hl = "MiniIconsGrey" },
			},
			directory = {
				r = { glyph = "󰴉", hl = "MiniIconsCyan" },
				R = { glyph = "󰴉", hl = "MiniIconsCyan" },
				proc = { glyph = "󱧼", hl = "MiniIconsYellow" },
				raw = { glyph = "󱋣", hl = "MiniIconsRed" },
				data = { glyph = "󱧶", hl = "MiniIconsGrey" },
				out = { glyph = "󱞊", hl = "MiniIconsGrey" },
			},
		})

		require("mini.diff").setup({ -- Git diff in sign column
			view = {
				style = "sign",
				signs = { add = "+", change = "~", delete = "-" },
			},
		})

		-- Replace nvim-web-devicons with mini.icons
		MiniIcons.mock_nvim_web_devicons()

		-- Commented out modules (consider enabling if needed):
		-- require("mini.bracketed").setup({  -- Navigate with ]f, ]q, etc.
		-- 	file = { suffix = "" },
		-- 	quickfix = { suffix = "f" },
		-- })
		-- require("mini.tabline").setup({ tabpage_section = "right" })
		-- require("mini.statusline").setup()  -- Using nvchad statusline instead
	end,
}
