require("setup.remap")
require("setup.lazy")
print("Welcome to Junseo's NeoVim!")

-- tabs and spaces
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab = true

-- backspace to prev line
-- without this, you backspace is limited
vim.opt.backspace='indent,eol,start'

--- ui configs
vim.opt.number = true
vim.opt.showcmd  = true
vim.opt.cursorline = true  -- highlight current line
vim.opt.showmatch = true         -- show matching [{()}]
vim.opt.wildmenu = true          -- autocomplete for command line
vim.opt.updatetime=100     -- some plugins require fast update time
vim.opt.ttyfast = true            -- Improve redrawing
vim.opt.mouse='a'           -- mouse support - necessary evil
vim.opt.encoding='utf-8'     -- set korean encodings (termencoding does not exist in Neovim)
vim.opt.ttimeout  = true          -- faster esc
vim.opt.ttimeoutlen=50     -- faster esc 50ms
vim.opt.clipboard='unnamedplus'

-- search options
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true


-- for vim-airline
vim.opt.laststatus=2
vim.opt.showtabline=2
vim.opt.cmdheight=1
vim.opt.ruler=true
vim.opt.showmode=false
vim.g.airline_theme = "catppuccin"

--colorscheme
-- set true colors
vim.opt.termguicolors = true
vim.opt.background='dark'

-- faster Scroll
vim.keymap.set('n', '<C-e>', '10<C-e>', { desc = 'faster scroll' })
vim.keymap.set('n', '<C-y>', '10<C-y>', { desc = 'faster scroll' })

-- copy and paste from system clipboard
vim.opt.clipboard='unnamedplus'
vim.keymap.set('n', '<leader>y', '\"+y', { desc = 'copy to system clipboard' })
vim.keymap.set('n', '<leader>d', '\"+d', { desc = 'copy to system clipboard' })
vim.keymap.set('n', '<leader>pm', ':set paste<CR>', { desc = 'set paste mode' })
vim.keymap.set('n', '<leader>pn', ':set nopaste<CR>', { desc = 'unset paste mode' })

-- history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('$HOME/.nvim/undodir')
vim.opt.undolevels = 5000
vim.opt.swapfile = true
vim.opt.directory = vim.fn.expand('$HOME/.nvim/swapdir')


-- create directories for undodir and backupdir
if vim.fn.isdirectory(vim.fn.expand('$HOME/.nvim/undodir')) == 0 then
  vim.fn.mkdir(vim.fn.expand('$HOME/.nvim/undodir'), 'p')
end
if vim.fn.isdirectory(vim.fn.expand('$HOME/.nvim/swapdir')) == 0 then
  vim.fn.mkdir(vim.fn.expand('$HOME/.nvim/swapdir'), 'p')
end

-- filetype
vim.cmd('filetype plugin indent on')
vim.cmd('autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=2')

--------------------- LSP ------------------------------
local lsp = require('lsp-zero')

lsp.preset('recommended')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    -- format with gq for C/C++/CUDA
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'c' or vim.bo.filetype == 'cuda' then
      vim.keymap.set({'n', 'x'}, 'gq', function()
        vim.lsp.buf.format({async = false, timeout_ms = 10000})
      end, opts)
    end
  end
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete()
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_enable = false,
  ensure_installed = {
    'clangd', 'pyright', 'lua_ls',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})
