return {
	"piersolenski/wtf.nvim",
	event = "UIEnter",
	dependencies = { "muniftanjim/nui.nvim" },
	config = function()
		require("wtf").setup({
			popup_type = "popup",
			openai_api_key = os.getenv("OPENAI_API_KEY"),
			openai_model_id = "gpt-4o-mini",
		})
	end,
}