local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sG', builtin.git_files, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})


