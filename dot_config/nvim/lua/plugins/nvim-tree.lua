return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		cmd = "NvimTreeToggle",
		dependencies = {
			{
				"antosha417/nvim-lsp-file-operations",
				lazy = true,
			},
			{
				"b0o/nvim-tree-preview.lua",
				lazy = true,
			},
		},
		config = function()
			dofile(vim.g.base46_cache .. "nvimtree")
			require("nvim-tree").setup({
				diagnostics = { enable = true },
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					api.config.mappings.default_on_attach(bufnr)

					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					local preview = require("nvim-tree-preview")

					vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
					vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))

					-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
					vim.keymap.set("n", "<Tab>", function()
						local ok, node = pcall(api.tree.get_node_under_cursor)
						if ok and node then
							if node.type == "directory" then
								api.node.open.edit()
							else
								preview.node(node, { toggle_focus = true })
							end
						end
					end, opts("Preview"))
				end,
			})
		end,
	},
}
