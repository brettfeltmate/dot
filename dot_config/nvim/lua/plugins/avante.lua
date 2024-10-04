return  {
    'yetone/avante.nvim',
    event = "BufReadPre",
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require('avante').setup({})
    end,
}
