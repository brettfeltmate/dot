return {
	"nullishamy/autosave.nvim",
	event = "InsertEnter",
	config = function()
		require("autosave").setup({
			events = {
				triggers = { "InsertLeave" },
			},
		})
	end,
}
