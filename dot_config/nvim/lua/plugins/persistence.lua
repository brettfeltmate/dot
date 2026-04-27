return {
	"folke/persistence.nvim",
	event = "UIEnter",
	enabled = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
	config = function()
		require("persistence").setup({
			options = { "globals" },
			pre_save = function()
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
			end,
		})

		-- Create 'SR' command to load the last session
		vim.api.nvim_create_user_command("SR", function()
			require("persistence").load()
		end, { nargs = 0 })
	end,
}
