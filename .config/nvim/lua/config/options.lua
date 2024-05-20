-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.g.mapleader = "<space>"
-- vim.g.maplocalleader = "<space>"

vim.cmd([[set number]])
vim.cmd([[set nornu]])

vim.opt.backspace = "indent,eol,start"
vim.opt.colorcolumn = "80"
vim.opt.hidden = true
vim.opt.number = true
vim.opt.shiftwidth = 8
vim.opt.tabstop = 8
vim.opt.wrap = true
vim.opt.termguicolors = true

vim.opt.foldopen = "block"
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 0
vim.opt.foldenable = false

vim.opt.timeout = true
vim.opt.timeoutlen = 1000

-- DISABLE MOUSE
vim.opt.mouse = nil

vim.opt.listchars = "tab:> ,trail:-,space:-,eol:$"
vim.opt.list = false
