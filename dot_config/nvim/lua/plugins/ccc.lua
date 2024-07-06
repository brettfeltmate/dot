return {
	"uga-rosa/ccc.nvim",
	event = "BufEnter",
	config = function()
		local ccc = require("ccc")
		local mapping = ccc.mapping
		require("ccc").setup({
			auto_enable = true,
			lsp = true,
			-- fg | bg | virtual
			highlight_mode = "virtual",
		})
	end,
}
