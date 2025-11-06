---@brief
---
--- https://clangd.llvm.org/
---
--- C/C++ language server.
---
--- clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html) 
--- specified as compile_commands.json, or for simpler projects, a compile_flags.txt.

---@type vim.lsp.Config
return {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        '.git',
    },
    single_file_support = true,
    capabilities = {
        offsetEncoding = { "utf-16" },
    },
}