vim.keymap.set('n', '<leader>jf', ':JuliaFormatterFormat<CR>', { noremap = true })

vim.g.JuliaFormatter_options = {
    indent = 4,
    margin = 92,
    always_for_in = true,
    whitespace_typedefs = false,
    whitespace_ops_in_indices = true,
}



