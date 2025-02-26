local has_quicker, _ = pcall(require, "quicker")

if has_quicker then
	vim.keymap.set({ "n" }, "<localleader>e", function()
		require("quicker").expand()
	end, { desc = "Expand" })

	vim.keymap.set({ "n" }, "<localleader>c", function()
		require("quicker").collapse()
	end, { desc = "Collapse" })

	vim.keymap.set({ "n" }, "<localleader>r", function()
		require("quicker").refresh(nil, {keep_diagnostics = true})
	end, { desc = "Refresh" })
end
