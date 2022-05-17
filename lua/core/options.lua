local opt = vim.opt
local fn = vim.fn

-- Colorscheme
opt.termguicolors = true
-- vim.cmd [[colorscheme tokyonight]]

-- For spell checking
opt.spelllang = "en"

-- Indentation and tabbing
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true
opt.expandtab = true
opt.cindent = true

-- Turn off word wrapping
opt.wrap = false

-- Let language syntax take care of folding blocks
opt.foldmethod = "syntax"
opt.foldlevelstart = 20 -- opens folds by default on buffer load

-- Start vertical scroll when 8 characters away
opt.scrolloff = 8

-- Natural window splitting feeling
opt.splitbelow = true
opt.splitright = true

-- Searching
opt.incsearch = true
opt.hlsearch = false

-- Turn off case sensitive searching
opt.ignorecase = true
opt.smartcase = true

-- Relative numbers
opt.relativenumber = true
opt.number = true

-- Ruler and columns
opt.colorcolumn = "80"
opt.signcolumn = "yes"
vim.highlight.create('ColorColumn', {ctermbg=0, guibg=lightgrey}, false)
opt.cursorline = true

-- Get rid of swap files and backups - generally never use these features.
opt.swapfile = false
opt.backup = false

opt.undodir = fn.getenv("HOME").."/.vim/undodir"
opt.undofile = true

opt.hidden = true
opt.errorbells = false

-- Give more space for displaying messages
opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.o.shortmess = vim.o.shortmess .. "c"

