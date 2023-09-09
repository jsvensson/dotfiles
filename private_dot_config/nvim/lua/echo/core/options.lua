local opt = vim.opt

-- Enable color mode for color schemes
opt.termguicolors = true

-- line numbers
opt.relativenumber = true
opt.number = true -- show absolute line number on current line

-- always show space for diagnostics in gutter
opt.signcolumn = "yes"

opt.fillchars = { eob = ' ' }

-- tabs/indentation
opt.tabstop = 2

-- line wrapping
opt.wrap = false

-- turn off swapfile
opt.swapfile = false
