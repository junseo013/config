-- Catppuccin Mocha customized: black background via theme API (no manual overrides)
vim.opt.background = 'dark'
vim.opt.termguicolors = true

local black = '#000000'
local black_soft = '#0a0a0a'
local border_gray = '#404040'
local linenr_gray = '#505050'
local linenr_current = '#707070'

require('catppuccin').setup({
  flavour = 'mocha',
  -- Make all base/surface colors black so the whole theme uses black bg
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
      Visual = { bg = '#333333' },
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

vim.cmd.colorscheme('catppuccin-mocha')
