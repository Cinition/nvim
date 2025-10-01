return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {}
                },
            }

            require('telescope').load_extension('fzf')

            -- Quick keymap for nvim adjustment
            vim.keymap.set('n', '<leader>np', function()
                local opts = require('telescope.themes').get_dropdown({
                    cwd = vim.fn.stdpath('config'),
                    previewer = false,
                    layout_config = {
                        height = 30
                    },
                });
                require('telescope.builtin').find_files(opts)
            end)

            vim.keymap.set('n', '<leader>s', require('telescope.builtin').live_grep) -- Only show filename
            vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers)   -- Only show filename
            vim.keymap.set('n', '<leader>ts', require('telescope.builtin').treesitter)   -- Only show filename
            vim.keymap.set('n', '<leader>nh', require('telescope.builtin').help_tags)
            vim.keymap.set('n', '<leader>f', function()
                local opts = require('telescope.themes').get_dropdown({
                    previewer = false,
                    layout_config = {
                        height = 30
                    },
                });
                require('telescope.builtin').find_files(opts)
            end)
            vim.keymap.set('n', '<leader>/', function()
                local opts = require('telescope.themes').get_dropdown({
                    previewer = false,
                    layout_config = {
                        height = 30
                    },
                });
                require('telescope.builtin').current_buffer_fuzzy_find(opts)
            end)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    local map = function(keys, func)
                        vim.keymap.set('n', keys, func, { buffer = event.buf })
                    end

                    map('gr', require('telescope.builtin').lsp_references)
                    map('gd', require('telescope.builtin').lsp_definitions)
                    map('gi', require('telescope.builtin').lsp_implementations)


                    map('<leader>td', require('telescope.builtin').lsp_type_definitions)
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols)
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
                end
            });
        end
    }
}
