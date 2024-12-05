return {
	"tadaa/vimade",
	lazy = true,
	event = "BufRead",
	config = function()
		local Duo = require("vimade.recipe.duo").Duo
		require("vimade").setup(Duo({ duration = 300 }))
		vim.g.vimade.fadelevel = 0.8
	end,
}
