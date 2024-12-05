return {
    'glepnir/nerdicons.nvim',
    lazy = true,
    cmd = 'NerdIcons',
    opts = {},
    config = function(_, opts)
        require('nerdicons').setup(opts)
    end
}
