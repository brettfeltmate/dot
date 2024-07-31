return {
    "m4xshen/hardtime.nvim",
    dependencies = { "muniftanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require('hardtime').setup({
            disabled_filetyes = {"mini"},
        })
    end,
}
