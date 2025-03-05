vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references) -- Only show filename
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions) -- Only show filename
vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations) -- Only show filename
vim.keymap.set('n', '<leader>td', require('telescope.builtin').lsp_type_definitions)
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols)
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)

