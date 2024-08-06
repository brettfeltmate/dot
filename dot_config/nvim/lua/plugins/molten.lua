if true then
	return {}
end

return {
	"benlubas/molten-nvim",
	event = "VeryLazy",
	dependencies = { "3rd/image.nvim" },
	build = ":UpdateRemotePlugins",
	init = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_output_win_max_height = 20
	end,
}
