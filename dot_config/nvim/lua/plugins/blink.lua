return {
	{
		"saghen/blink.cmp",
		lazy = true,
		event = "BufReadPre",
		version = "v0.2.1",
		opts = {
			keymap = {
				show = "<C-space>",
				hide = "<C-e>",
				accept = "<C-l>",
				select_prev = { "<C-k>" },
				select_next = { "<C-j>" },
				show_documentation = "<C-s>",
				hide_documentation = "<C-S>",
				scroll_documentation_up = "<C-p>",
				scroll_documentation_down = "<C-n>",
			},
			signature_help = {
				enabled = true,
			},
		},
		sources = {
			providers = {
				{ "blink.cmp.sources.lsp", name = "LSP" },
				{ "blink.cmp.sources.path", name = "Path", score_offset = 3 },
				{ "blink.cmp.sources.buffer", name = "Buffer", fallback_for = { "LSP" } },
			},
			windows = {
				autocomplete = {
					min_width = 15,
					max_height = 10,
					border = "single",
					winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					-- keep the cursor X lines away from the top/bottom of the window
					scrolloff = 2,
					-- which directions to show the window,
					-- falling back to the next direction when there's not enough space
					direction_priority = { "s", "n" },
					-- Controls how the completion items are selected
					-- 'preselect' will automatically select the first item in the completion list
					-- 'manual' will not select any item by default
					-- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
					selection = "manual",
					-- Controls the cycling behavior when reaching the beginning or end of the completion list.
					cycle = {
						-- When `true`, calling `select_next` at the *bottom* of the completion list will select the *first* completion item.
						from_bottom = true,
						-- When `true`, calling `select_prev` at the *top* of the completion list will select the *last* completion item.
						from_top = true,
					},
				},
				documentation = {
					min_width = 10,
					max_width = 60,
					max_height = 10,
					border = "single",
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					-- which directions to show the documentation window,
					-- for each of the possible autocomplete window directions,
					-- falling back to the next direction when there's not enough space
					direction_priority = {
						autocomplete_north = { "e", "w", "n", "s" },
						autocomplete_south = { "e", "w", "s", "n" },
					},
					auto_show = false,
					auto_show_delay_ms = 500,
					update_delay_ms = 50,
				},
				signature_help = {
					min_width = 1,
					max_width = 100,
					max_height = 10,
					border = "padded",
					winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
				},
			},

			highlight = {
				ns = vim.api.nvim_create_namespace("blink_cmp"),
				-- sets the fallback highlight groups to nvim-cmp's highlight groups
				-- useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release, assuming themes add support
				use_nvim_cmp_as_default = true,
			},

			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- adjusts spacing to ensure icons are aligned
			nerd_font_variant = "normal",

			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
	},
}
