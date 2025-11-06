---@brief
---
--- https://github.com/microsoft/vscode-html-languageservice
---
--- HTML language server.
---
--- `html-languageserver` can be installed via `npm`:
--- ```sh
--- npm i -g vscode-langservers-extracted
--- ```

---@type vim.lsp.Config
return {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html' },
    root_markers = {
        'package.json',
        '.git',
    },
    single_file_support = true,
}