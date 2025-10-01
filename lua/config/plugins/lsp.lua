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

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func)
                        vim.keymap.set('n', keys, func, { buffer = event.buf })
                    end

                    map("<leader>ff", function() vim.lsp.buf.format() end)
                    map("<leader>rn", function() vim.lsp.buf.rename() end)
                    map("gD", function() vim.lsp.buf.declaration() end)
                end
            });
        end,
    }
}
