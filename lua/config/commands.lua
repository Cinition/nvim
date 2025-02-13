-- Highlight when yanking command
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Nice selection reposition
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Center screen on half page movement
vim.keymap.set('n', '<C-d>', '<C-d> zz')
vim.keymap.set('n', '<C-u>', '<C-u> zz')

-- Center screen on search command
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Paste over selection without loosing previous yank buffer
vim.keymap.set('x', '<leader>p', '"_dP')

-- Blegh Q function
vim.keymap.set('n', 'Q', '<nop>')

-- quicklist usability commands
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')
