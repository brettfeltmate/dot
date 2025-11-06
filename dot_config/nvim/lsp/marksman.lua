---@brief
---
--- https://github.com/artempyanykh/marksman
---
--- Markdown language server.
---
--- `marksman` can be installed via various methods:
--- - From releases: https://github.com/artempyanykh/marksman/releases
--- - Via package managers (see project README)

---@type vim.lsp.Config
return {
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown', 'rmarkdown', 'quarto' },
    root_markers = {
        '.marksman.toml',
        '.git',
    },
    single_file_support = true,
}