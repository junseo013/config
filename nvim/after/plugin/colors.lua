-- Catppuccin Mocha with black background everywhere
vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.cmd.colorscheme('catppuccin-mocha')

local black = '#000000'
local black_soft = '#0a0a0a'
local border_gray = '#303030'
local linenr_gray = '#505050'   -- dim line numbers (avoid confusion with text)
local linenr_current = '#707070'  -- slightly brighter for current line

-- Editor: background only to black (keep catppuccin fg/syntax)
vim.api.nvim_set_hl(0, 'Normal', { bg = black })
-- Inactive/split window & area behind Telescope (non-current window)
vim.api.nvim_set_hl(0, 'NormalNC', { bg = black })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = black })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = black_soft })
vim.api.nvim_set_hl(0, 'LineNr', { bg = black, fg = linenr_gray })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = black, fg = linenr_current })

-- Nvim-tree (file explorer)
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = black })
vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = black })
vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = black, fg = black })
vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = black_soft })

-- Window split
vim.api.nvim_set_hl(0, 'VertSplit', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = black, fg = border_gray })

-- Status line
vim.api.nvim_set_hl(0, 'StatusLine', { bg = black_soft })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = black })

-- Float windows (Telescope find file, ripgrep, etc.)
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = black })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = black, fg = border_gray })
-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = black })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = black })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = black })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = black })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'TelescopeTitle', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = black, fg = border_gray })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = black, fg = border_gray })

-- Built-in tab line (fallback when bufferline not used)
vim.api.nvim_set_hl(0, 'TabLine', { bg = black })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = black })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = black_soft })
