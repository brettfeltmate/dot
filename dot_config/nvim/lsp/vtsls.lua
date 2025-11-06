---@brief
---
--- https://github.com/yioneko/vtsls
---
--- TypeScript language server.
---
--- `vtsls` can be installed via `npm`:
--- ```sh
--- npm i -g @vtsls/language-server
--- ```

---@type vim.lsp.Config
return {
    cmd = { 'vtsls', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = {
        'tsconfig.json',
        'package.json',
        'jsconfig.json',
        '.git',
    },
    single_file_support = true,
    settings = {
        typescript = {
            inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
            },
        },
    },
}