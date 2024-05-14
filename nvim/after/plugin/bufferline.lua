vim.opt.termguicolors = true
require("bufferline").setup{}

vim.keymap.set('n', '<C-l>', ':bn<CR>', { desc = 'go to the next buffer' })
vim.keymap.set('n', '<C-h>', ':bp<CR>', { desc = 'go to the previous buffer' })
