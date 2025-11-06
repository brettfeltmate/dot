---@brief
---
--- https://github.com/REditorSupport/languageserver
---
--- R language server.
---
--- `r-languageserver` can be installed via R:
--- ```r
--- install.packages("languageserver")
--- ```

---@type vim.lsp.Config
return {
	cmd = { "R", "--slave", "-e", "languageserver::run()" },
	filetypes = { "r", "rmd" },
	root_markers = {
		"DESCRIPTION",
		"NAMESPACE",
		".Rbuildignore",
		".Rproj.user",
		".git",
		".here",
		"renv.lock",
	},
	log_level = 2,
	settings = {
		r = {
			lsp = {
				rich_documentation = true,
				diagnostics = true,
			},
		},
	},
}

