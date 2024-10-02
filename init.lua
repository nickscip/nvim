vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.g.mapleader = " "           -- Set leader key to space
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Disabling swapfiles
vim.opt.swapfile = false
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = '*',
  command = 'checktime'
})
-- Change tab size depending on file type
vim.api.nvim_create_autocmd({ 'FileType', 'BufRead', 'BufNewFile' }, {
  pattern = '*.sql',
  command = 'setlocal tabstop=2 shiftwidth=2 expandtab'
})

vim.api.nvim_create_autocmd({ 'FileType', 'BufRead', 'BufNewFile' }, {
  pattern = '*.lua',
  command = 'setlocal tabstop=2 shiftwidth=2 expandtab'
})

vim.api.nvim_create_autocmd({ 'FileType', 'BufRead', 'BufNewFile' }, {
  pattern = '*.toml',
  command = 'setlocal tabstop=4 shiftwidth=4 expandtab'
})

require("lazy.lazy")
