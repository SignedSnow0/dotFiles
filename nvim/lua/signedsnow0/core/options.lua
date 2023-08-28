local opt = vim.opt

opt.relativenumber = true
opt.number = true -- absolute line on cursor

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- tab to spaces
opt.autoindent = true

opt.wrap = false -- line wrapping

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
