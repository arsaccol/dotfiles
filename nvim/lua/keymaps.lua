vim.g.mapleader = ','
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- display netrw
vim.keymap.set('n', '<Leader>w', ':write<CR>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'jj', '<CR>')

vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')


vim.keymap.set('n', '<leader>r', ':checktime <CR>')


vim.keymap.set('n', '<leader>w', ':w<CR>')
-- vim.keymap.set('n', '<C-s>', ':w<CR>')
-- vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a')

vim.keymap.set('n', '<leader>t', ':tabedit<CR>')
vim.keymap.set('n', '<leader>1', '1gt') 
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')


vim.keymap.set('n', 'evrc', ':vsp ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', 'srcv', ':source ~/.config/nvim/init.lua<CR>')


