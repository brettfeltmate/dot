return {
	"chentoast/marks.nvim",
	event = "InsertEnter",
	config = function()
		require("marks").setup({})
	end,
}
