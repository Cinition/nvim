return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'saghen/blink.cmp',
            { -- Setup up vim globals for lua files
                'folke/lazydev.nvim',
                ft = 'lua',
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require('lspconfig').lua_ls.setup { capabilities = capabilities }
            require('lspconfig').zls.setup { capabilities = capabilities }
            require('lspconfig').clangd.setup { capabilities = capabilities }

            vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
            vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
        end,
    }
}
