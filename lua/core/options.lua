vim.g.mapleader = " "
vim.g.localmapleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.laststatus = 3
vim.opt.statusline = " %f %m %= %l:%c "

vim.opt.cursorline = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

vim.opt.background = "dark"

vim.o.showmode = true

vim.opt.updatetime = 50

vim.opt.fillchars = { eob = " " }
