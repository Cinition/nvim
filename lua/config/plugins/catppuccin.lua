return {
    {
        'catppuccin/nvim',
        enabled = true,
        name = "catppuccin",
        priority = 1000,
        config = function ()
            local catppuccin = require 'catppuccin'
            catppuccin.setup({
                flavour = 'latte'
            })
            vim.cmd.colorscheme "catppuccin"
        end
    }
}
