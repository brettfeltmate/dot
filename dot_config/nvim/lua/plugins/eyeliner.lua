if true then
	return {}
end
-- return {
-- 	"jinh0/eyeliner.nvim",
-- 	lazy = true,
-- 	event = "BufRead",
-- 	opts = {
-- 		-- show highlights only after keypress
-- 		highlight_on_key = true,
-- 		-- dim all other characters
-- 		dim = true,
-- 		-- add eyeliner to f/F/t/T keymaps;
-- 		-- see section on advanced configuration for more information
-- 		default_keymaps = true,
-- 	},
-- 	config = function(_, opts)
-- 		require("eyeliner").setup(opts)
-- 		vim.api.nvim_set_hl(0, "EyelinerPrimary", { bold = true, underline = false, fg = "#ffce94" })
-- 		vim.api.nvim_set_hl(0, "EyelinerSecondary", { bold = false, underline = false, fg = "#caa98e" })
-- 	end,
-- }
