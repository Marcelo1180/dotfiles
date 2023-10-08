vim.g.mapleader = ","
vim.g.maplocalleader = ","

local set = vim.opt

-- General config
set.inccommand = "nosplit"
set.number = true
set.fileencoding = "utf-8"
set.cursorline = true
set.mouse = "a"
set.showmatch = true
set.gcr = "a:blinkon500-blinkwait500-blinkoff500"
set.splitbelow = true
set.syntax = "on"

vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.backspace = "2"
vim.opt.autoread = true

-- Turn off swap files
set.swapfile = false
set.backup = false
set.wb = false

-- Indentation
set.tabstop = 2
set.shiftwidth = 2
set.shiftround = true
set.expandtab = true

vim.cmd "autocmd FileType javascript set sw=2"
vim.cmd "autocmd FileType javascript set ts=2"
vim.cmd "autocmd FileType javascript set sts=2"

vim.cmd "autocmd FileType python set sw=4"
vim.cmd "autocmd FileType python set ts=4"
vim.cmd "autocmd FileType python set sts=4"

-- vim.cmd "autocmd BufRead,BufNewFile *.jinja set filetype=html"
