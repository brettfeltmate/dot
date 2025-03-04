local function OpenMarkdownPreview(url)
	vim.fn.execute("silent ! open -a Firefox -n --args --new-window " .. url)
end

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	-- NOTE: Ensure yarn is installed
	build = "cd app && yarn install",
	init = function()
		local g = vim.g
		g.mkdp_browserfunc = "OpenMarkdownPreview"
		g.mkdp_auto_start = 0
		g.mkdp_auto_close = 1
		g.mkdp_refresh_slow = 0
		g.mkdp_command_for_global = 0
		g.mkdp_open_to_the_world = 0
		g.mkdp_open_ip = ""
		g.mkdp_browser = "firefox"
		g.mkdp_echo_preview_url = 0
		g.mkdp_browserfunc = ""
		g.mkdp_theme = "dark"
		g.mkdp_filetypes = { "markdown" }
		g.mkdp_page_title = "${name}.md"
		g.mkdp_preview_options = {
			disable_sync_scroll = 0,
			disable_filename = 1,
		}
	end,
}
