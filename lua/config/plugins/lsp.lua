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
            require('lspconfig').lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        workspace = {
                            library = {
                                vim.fn.expand("~/wkspaces/devroot/V3/Lua/lib")
                            },
                        }
                    }
                }
            }
            require('lspconfig').zls.setup { capabilities = capabilities }
            require('lspconfig').clangd.setup { capabilities = capabilities }
            require('lspconfig').rust_analyzer.setup {capabilities = capabilities}

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func)
                        vim.keymap.set('n', keys, func, { buffer = event.buf })
                    end

                    map('gr', require('telescope.builtin').lsp_references)
                    map('gd', require('telescope.builtin').lsp_definitions)
                    map('gi', require('telescope.builtin').lsp_implementations)
                    map("gD", function() vim.lsp.buf.declaration() end)

                    map('<leader>td', require('telescope.builtin').lsp_type_definitions)
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols)
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
                    map("<leader>ff", function() vim.lsp.buf.format() end)
                    map("<leader>rn", function() vim.lsp.buf.rename() end)
                end
            });
        end,
    }
}
