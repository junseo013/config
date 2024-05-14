-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_hijack_netrw = true
vim.g.nvim_tree_disable_netrw = false


-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

--vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', { desc = 'toggle nvim-tree' })
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'toggle nvim-tree' })
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { desc = 'find file in nvim-tree' })



-- OR setup with some options
--require("nvim-tree").setup({
--  sort = {
--    sorter = "case_sensitive",
--  },
--  view = {
--    width = 30,
--  },
--  renderer = {
--    group_empty = true,
--  },
--  filters = {
--    dotfiles = true,
--  },
--})
