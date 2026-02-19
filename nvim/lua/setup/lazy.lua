-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>sG", builtin.git_files, {})
      vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>ss", builtin.grep_string, {})
      -- lsp via telescope
      vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "lsp references" })
      vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "lsp definitions" })
      vim.keymap.set("n", "<leader>lim", builtin.lsp_implementations, { desc = "lsp implementations" })
      vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, { desc = "lsp type definitions" })
    end,
  },

  -- color schemes
  { "rose-pine/neovim", name = "rose-pine" },
  { "folke/tokyonight.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local black = "#000000"
      local black_soft = "#0a0a0a"
      local border_gray = "#404040"
      local linenr_gray = "#505050"
      local linenr_current = "#707070"

      require("catppuccin").setup({
        flavour = "mocha",
        color_overrides = {
          mocha = {
            base = black,
            mantle = black,
            crust = black,
            surface0 = black_soft,
            surface1 = black_soft,
            surface2 = black_soft,
          },
        },
        custom_highlights = function(colors)
          return {
            Normal = { bg = black },
            NormalNC = { bg = black },
            SignColumn = { bg = black },
            CursorLine = { bg = black_soft },
            Visual = { bg = "#333333" },
            LineNr = { bg = black, fg = linenr_gray },
            CursorLineNr = { bg = black, fg = linenr_current },
            VertSplit = { bg = black, fg = border_gray },
            WinSeparator = { bg = black, fg = border_gray },
            NvimTreeNormal = { bg = black },
            NvimTreeNormalNC = { bg = black },
            NvimTreeEndOfBuffer = { bg = black, fg = black },
            NvimTreeCursorLine = { bg = black_soft },
            NormalFloat = { bg = black },
            FloatBorder = { bg = black, fg = border_gray },
            TelescopeNormal = { bg = black },
            TelescopeBorder = { bg = black, fg = border_gray },
            TelescopePromptNormal = { bg = black },
            TelescopePromptBorder = { bg = black, fg = border_gray },
            TelescopeResultsNormal = { bg = black },
            TelescopeResultsBorder = { bg = black, fg = border_gray },
            TelescopePreviewNormal = { bg = black },
            TelescopePreviewBorder = { bg = black, fg = border_gray },
            TelescopeTitle = { bg = black, fg = border_gray },
            TelescopePromptTitle = { bg = black, fg = border_gray },
            TelescopeResultsTitle = { bg = black, fg = border_gray },
            TelescopePreviewTitle = { bg = black, fg = border_gray },
            TabLine = { bg = black },
            TabLineFill = { bg = black },
            TabLineSel = { bg = black_soft },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.nvim_tree_hijack_netrw = true
      vim.g.nvim_tree_disable_netrw = false
      require("nvim-tree").setup()
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "toggle nvim-tree" })
      vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", { desc = "find file in nvim-tree" })
    end,
  },

  -- language syntax parser (pinned to v0.9.x for Neovim 0.10 compat)
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- parsers are already installed; auto_install adds new ones on demand
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

  -- copilot
  { "github/copilot.vim" },

  -- undo tree
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },

  -- git
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "┃" },
          change       = { text = "┃" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        signs_staged = {
          add          = { text = "┃" },
          change       = { text = "┃" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        signs_staged_enable = true,
        signcolumn = true,
        numhl      = false,
        linehl     = false,
        word_diff  = false,
        watch_gitdir = { follow_files = true },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({"]c", bang = true})
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({"[c", bang = true})
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>hs", gitsigns.stage_hunk)
          map("v", "<leader>hs", function() gitsigns.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
          map("n", "<leader>hS", gitsigns.stage_buffer)
          map("n", "<leader>hu", gitsigns.undo_stage_hunk)
          map("n", "<leader>hp", gitsigns.preview_hunk)
          map("n", "<leader>hb", function() gitsigns.blame_line{full=true} end)
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
          map("n", "<leader>hd", gitsigns.diffthis)
          map("n", "<leader>hD", function() gitsigns.diffthis("~") end)

          -- Text object
          map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })
    end,
  },

  -- lsp
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  { "neovim/nvim-lspconfig", tag = "v2.5.0" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },

  -- gui: airline
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },

  -- highlighting
  {
    "yggdroot/indentline",
    config = function()
      vim.g.indentLine_color_term = 243
      vim.g.indentLine_char_list = {}
      vim.g.indentLine_char = "│"
    end,
  },
  { "andymass/vim-matchup" },
  { "machakann/vim-highlightedyank" },

  -- ctags
  { "universal-ctags/ctags" },

  -- todo
  { "sakshamgupta05/vim-todo-highlight" },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local black = "#000000"
      local black_soft = "#0a0a0a"
      local border_gray = "#45475a"

      require("bufferline").setup({
        highlights = {
          fill = { bg = black },
          background = { bg = black },
          buffer = { bg = black },
          buffer_visible = { bg = black },
          buffer_selected = { bg = black_soft },
          tab = { bg = black },
          tab_selected = { bg = black_soft },
          tab_close = { bg = black },
          close_button = { bg = black },
          close_button_visible = { bg = black },
          close_button_selected = { bg = black_soft },
          numbers = { bg = black },
          numbers_visible = { bg = black },
          numbers_selected = { bg = black_soft },
          separator = { bg = black, fg = border_gray },
          separator_visible = { bg = black, fg = border_gray },
          separator_selected = { bg = black_soft, fg = border_gray },
          tab_separator = { bg = black, fg = border_gray },
          tab_separator_selected = { bg = black_soft, fg = border_gray },
          group_separator = { bg = black, fg = border_gray },
          indicator_selected = { bg = black_soft },
          indicator_visible = { bg = black },
          modified = { bg = black },
          modified_visible = { bg = black },
          modified_selected = { bg = black_soft },
          duplicate = { bg = black },
          duplicate_visible = { bg = black },
          duplicate_selected = { bg = black_soft },
          trunc_marker = { bg = black, fg = border_gray },
          diagnostic = { bg = black },
          diagnostic_visible = { bg = black },
          diagnostic_selected = { bg = black_soft },
          hint = { bg = black },
          hint_visible = { bg = black },
          hint_selected = { bg = black_soft },
          hint_diagnostic = { bg = black },
          hint_diagnostic_visible = { bg = black },
          hint_diagnostic_selected = { bg = black_soft },
          info = { bg = black },
          info_visible = { bg = black },
          info_selected = { bg = black_soft },
          info_diagnostic = { bg = black },
          info_diagnostic_visible = { bg = black },
          info_diagnostic_selected = { bg = black_soft },
          warning = { bg = black },
          warning_visible = { bg = black },
          warning_selected = { bg = black_soft },
          warning_diagnostic = { bg = black },
          warning_diagnostic_visible = { bg = black },
          warning_diagnostic_selected = { bg = black_soft },
          error = { bg = black },
          error_visible = { bg = black },
          error_selected = { bg = black_soft },
          error_diagnostic = { bg = black },
          error_diagnostic_visible = { bg = black },
          error_diagnostic_selected = { bg = black_soft },
          pick = { bg = black },
          pick_visible = { bg = black },
          pick_selected = { bg = black_soft },
        },
      })
      vim.keymap.set("n", "<C-l>", ":bn<CR>", { desc = "go to the next buffer" })
      vim.keymap.set("n", "<C-h>", ":bp<CR>", { desc = "go to the previous buffer" })
    end,
  },
})
