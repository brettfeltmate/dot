return {
	"ibhagwan/fzf-lua",
	lazy = true,
	config = function()
		require("fzf-lua").setup({
            winopts = {
                backdrop = 95,
                border = "thicc",
            },
			files = {
				["ctrl-alt-q"] = require("fzf-lua.actions").file_sel_to_qf,
				["ctrl-alt-l"] = require("fzf-lua.actions").file_sel_to_ll,
			},
            previewers = {
                builtin = {
                    extensions = {
                        -- neovim terminal only supports `viu` block output
                        ["png"] = { "viu" },
                        ["jpg"] = { "ueberzug" },
                    },
                    ueberzug_scaler = "cover",
                },
            }
		})
		require("fzf-lua").register_ui_select()
	end,
}
