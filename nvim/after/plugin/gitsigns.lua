require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,
  numhl      = false,
  linehl     = false,
  word_diff  = false,
  watch_gitdir = { follow_files = true },
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = { enable = false },
})

-- optional: hunk 이동
vim.keymap.set('n', ']h', require('gitsigns').next_hunk, { desc = 'Next hunk' })
vim.keymap.set('n', '[h', require('gitsigns').prev_hunk, { desc = 'Prev hunk' })
vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk, { desc = 'Reset hunk' })
