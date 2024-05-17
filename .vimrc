set nocompatible
filetype off
set encoding=UTF-8

" We are patient in this house (timeout for Plug increased from 60 to 600)
let g:plug_timeout = 600

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'alvan/vim-closetag'
Plug 'embear/vim-localvimrc'
Plug 'enricobacis/vim-airline-clock'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'jmcantrell/vim-virtualenv'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'ryanoasis/vim-devicons'

Plug 'koirand/tokyo-metro.vim'
Plug 'dylanaraps/wal.vim'
Plug 'mbbill/undotree'
Plug 'huyvohcmc/atlas.vim'
Plug 'axvr/photon.vim'
Plug 'widatama/vim-phoenix'
Plug 'jaredgorski/Mies.vim'
Plug 'ntk148v/komau.vim'
Plug 'folke/tokyonight.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'tikhomirov/vim-glsl'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'mustache/vim-mustache-handlebars'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'neovim/nvim-lspconfig'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'wellle/tmux-complete.vim'

Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-translator'
Plug 'folke/todo-comments.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
" or                                , { 'branch': '0.1.x' }

Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-markdown'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" ============================================================================

" COLORSCHEME

set bg=dark
" colorscheme photon
" colorscheme 256_noir
" colorscheme komau
" colorscheme mies
" colorscheme Tomorrow-Night
" colorscheme tokyo-metro
" colorscheme SerialExperimentsLain
" colorscheme monokai-phoenix
" colorscheme Benokai
" colorscheme brogrammer
" colorscheme wombat256dave
" colorscheme solarized8_high
" colorscheme eva01
" colorscheme nefertiti
" colorscheme eva01-LCL
" colorscheme alduin
" colorscheme seoul256
" colorscheme moonshine
" colorscheme badwolf
" colorscheme 1989
" colorscheme neonwave
" colorscheme behelit
" colorscheme gruvbox
" colorscheme Chasing_Logic
" colorscheme ayu
" colorscheme apprentice
" colorscheme sonokai
" colorscheme termschool
" colorscheme wal
" colorscheme matrix
" colorscheme cyberpunk
" colorscheme zenburn
" colorscheme tigrana-256-dark
" colorscheme 256-grayvim
" colorscheme tokyonight-moon
" colorscheme kanagawa
colorscheme kanagawa-dragon
" colorscheme kanagawa-lotus
" colorscheme kanagawa-wave
" colorscheme atlas
" colorscheme elflord
" colorscheme redblack
" colorscheme default
" colorscheme icansee

function! SetPhoenixColorscheme()
	let day = strftime("%w")

	colorscheme phoenix

	if day == 1
		:PhoenixBlue
	elseif day == 2
		:PhoenixGreen
	elseif day == 3
		:PhoenixYellow
	elseif day == 4
		:PhoenixPurple
	elseif day == 5
		:PhoenixOrange
	else
		:PhoenixRed
	endif
endfunction

call SetPhoenixColorscheme()

":hi Normal guibg=NONE ctermbg=NONE

" ============================================================================
"
" COMMANDS, MAPS, AND IMAPS

" ---------------------------
:command Bclose bp|bd#

let mapleader=","
noremap <C-n> :NERDTreeToggle <CR>
noremap <F5>  :!make -j4      <CR>
noremap <F6>  :!make -j4 run  <CR>

:imap ;hash <C-R>=system('head -c 16 /dev/urandom \| xxd -p')<cr><BS>
:imap ;guard <C-O>mz#ifndef %%%<CR>#define %%%<CR>#endif  // %%%<C-O>'z;;
:imap ;struct <C-O>mzstruct %%% {<CR>%%%<CR><BS><BS>};<C-O>'z;;
:imap ;main <C-O>mzint main (int argc, char* argv[]) {<CR>%%%<CR><BS><BS>}<C-O>'z;;
:imap ;wh <C-O>mzwhile (%%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;
:imap ;nm <C-O>mznamespace %%% {<CR><CR>} // namespace %%%<C-O>'z;;
:imap ;fo <C-O>mzfor (%%%; %%%; %%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;
:imap ;; <C-O>/%%%<CR><C-O>c3l
:nmap ;; /%%%<CR>c3l

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

map <M-t> :TranslateW<cr>

" ============================================================================
"
" PLUGINS CONFIGURATIONS

" Use python venv if available
let g:virtualenv_auto_activate = 1

" Configure powerline status bar
let g:airline_powerline_fonts            = 1
let g:airline_theme                      = 'monochrome'
let g:Powerline_symbols                  = 'fancy'
let g:airline#extensions#tabline#enabled = 1

let g:SuperTabClosePreviewOnPopupClose = 1

"----------------------------------------
let g:molokai_original        = 1
let g:javascript_plugin_jsoc  = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

"----------------------------------------
" CLOSETAGS FILETYPES
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.hbs'

"----------------------------------------
let g:go_version_warning = 0

set cinoptions=g0,:0,t0,N-s,E-s,(0,ks,(s,m1

"----------------------------------------
" TRANSLATOR OPTIONS 前の人
let g:translator_target_lang = 'en'
let g:translator_source_lang = 'auto'


" ============================================================================
"
" LSP Options

let g:lsp_auto_enable = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>gd <plug>(lsp-definition)
    nmap <buffer> <leader>gs <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>gr <plug>(lsp-references)
    nmap <buffer> <leader>gi <plug>(lsp-implementation)
    nmap <buffer> <leader>gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>[g <plug>(lsp-previous-diagnostic)
    nmap <buffer> <leader>]g <plug>(lsp-next-diagnostic)
    nmap <buffer> <leader>K <plug>(lsp-hover)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 50
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ============================================================================

" Asyncomplete Options

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Asymcomplete TAB completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

imap <c-space> <Plug>(asyncomplete_force_refresh)
imap <Nul> <Plug>(asyncomplete_force_refresh)

" ---------------------------
" Asyncomplete Tmux

let g:tmuxcomplete#asyncomplete_source_options = {
            \ 'name':      'tmuxcomplete',
            \ 'whitelist': ['*'],
            \ 'config': {
            \     'splitmode':      'words',
            \     'filter_prefix':   1,
            \     'show_incomplete': 1,
            \     'sort_candidates': 0,
            \     'scrollback':      0,
            \     'truncate':        0
            \     }
            \ }

" ============================================================================
"
" Mustache options
let g:mustache_abbreviations = 1

" ============================================================================
"
" Telescope options

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>un <cmd>UndotreeToggle<cr>

" Using Lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" ============================================================================

" CUSTOM OPTIONS
set tabstop=4
set shiftwidth=4
set hidden
set number
set backspace=indent,eol,start " Allow backspacing over everything in insert mode

set foldopen-=block
set foldmethod=indent
set foldlevelstart=0
set nofoldenable

set timeout timeoutlen=1000

" DISABLE MOUSE
set mouse=

" SHOW COLUMN LIMIT AT 80 CHARS
if exists('+colorcolumn')
  set colorcolumn=80
endif
syntax on

set t_Co=256

