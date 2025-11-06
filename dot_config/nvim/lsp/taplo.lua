---@brief
---
--- https://github.com/tamasfe/taplo
---
--- TOML language server.
---
--- `taplo` can be installed via:
--- - Cargo: `cargo install taplo-cli --locked`
--- - From releases: https://github.com/tamasfe/taplo/releases

---@type vim.lsp.Config
return {
    cmd = { 'taplo', 'lsp', 'stdio' },
    filetypes = { 'toml' },
    root_markers = {
        '*.toml',
        '.git',
    },
    single_file_support = true,
}