return {
    'skywind3000/vim-color-export',
    lazy = true,
    cmd = 'ColorExport',
    config = function()
        vim.g.color_export_all = 0
        vim.g.color_export_extra = {'GitGutterAdd', 'GitGutterChange', 'GitGutterDelete'}
        vim.g.color_export_convert = 1
    end,
}
