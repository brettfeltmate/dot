-- Enable 'mini.clue' triggers in copilot-chat buffer
if _G.MiniClue ~= nil then
	MiniClue.enable_buf_triggers(vim.api.nvim_get_current_buf())
end

vim.keymap.set("n", "<C-p>", function()
	print(require("CopilotChat").response())
end, { buffer = true, remap = true })
