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

	-- which-key setup for quickfix
	local ok, wk = pcall(require, "which-key")
	if ok then
		wk.add({
			{ "<localleader>", group = "Quickfix", icon = "󰁨" },
			{ "<localleader>e", icon = "󰊕" },
			{ "<localleader>c", icon = "󰊖" },
			{ "<localleader>r", icon = "󰚰" },
		})
	end
end
