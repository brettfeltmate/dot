return {
	"doriancmore/practice.nvim",
	lazy = true,
	cmd = "StartTypingChallenge",
    config = function()
        require("practice").setup()
    end,
}
