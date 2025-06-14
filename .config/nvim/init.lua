require("config.lazy")
require("config.autocmds")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("autoupdate"),
	callback = function()
		vim.opt.clipboard = "unnamedplus"

		vim.opt.number = true

		vim.cmd([[
set nu

hi Normal guibg=NONE ctermbg=NONE

" hi DiagnosticError gui=bold
" hi DiagnosticInfo gui=bold
" hi! link FloatBorder DiagnosticInfo
" hi NormalFloat guibg=black

set mouse=a

set signcolumn=yes
set termguicolors

" Use persistent history
if !isdirectory("/tmp/.vim-undo-dir")
	call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

set cc=80
set scrolloff=999 " Always center cursor

]])
	end,
})

vim.o.matchpairs = vim.o.matchpairs .. ",<:>"

vim.lsp.set_log_level('off');

vim.cmd([[colorscheme github_dark_high_contrast]]);
