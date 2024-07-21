if true then
	return {}
end

return {
	"declancm/cinnamon.nvim",
	event = "VimEnter",
	config = function()
		require("cinnamon").setup({
			keymaps = {
				basic = true,
				extra = true,
			},
			options = {
				delay = 2,
				max_delta = { time = 500 },
			},
		})
	end,
}
