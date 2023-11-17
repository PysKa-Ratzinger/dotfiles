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

Plug 'TroyFletcher/vim-colors-synthwave'
"Plug 'agude/vim-eldar'
Plug 'alvan/vim-closetag'
"Plug 'davidhalter/jedi-vim'
Plug 'embear/vim-localvimrc'
Plug 'enricobacis/vim-airline-clock'
Plug 'fatih/vim-go'
Plug 'jelera/vim-javascript-syntax'
Plug 'koirand/tokyo-metro.vim'
"Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
"Plug 'rdnetto/YCM-Generator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
"Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tikhomirov/vim-glsl'
Plug 'jmcantrell/vim-virtualenv'
Plug 'huyvohcmc/atlas.vim'
Plug 'iamcco/markdown-preview.nvim'
Plug 'ryanoasis/vim-devicons'
"Plug 'bfrg/vim-cpp-modern'
Plug 'dylanaraps/wal.vim'
"Plug 'shawncplus/phpcomplete.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'keremc/asyncomplete-clang.vim'
"Plug 'laixintao/asyncomplete-gitcommit'
Plug 'wellle/tmux-complete.vim'
Plug 'mustache/vim-mustache-handlebars'

" Snippets plugin
"Plug 'SirVer/ultisnips'

" Plugins added for work with PHP (still ended up using phpstorm :P )
Plug 'mhinz/vim-startify'
"Plug 'tobyS/vmustache'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
" or                                , { 'branch': '0.1.x' }

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" ============================================================================

" COLORSCHEME

"set bg=dark
" colorscheme Tomorrow-Night
colorscheme tokyo-metro
" colorscheme SerialExperimentsLain
" colorscheme monokai-phoenix
" colorscheme Benokai
" colorscheme brogrammer
" colorscheme wombat256dave
" colorscheme solarized8_high
" colorscheme eva01
" colorscheme nefertiti
" colorscheme eva01-LCL
" colorscheme badwolf
" colorscheme 1989
" colorscheme neonwave
" colorscheme gruvbox
" colorscheme Chasing_Logic
" colorscheme ayu
" colorscheme apprentice
" colorscheme sonokai
" colorscheme termschool
" colorscheme wal

:hi Normal guibg=NONE ctermbg=NONE

" ============================================================================
"
" COMMANDS, MAPS, AND IMAPS

" ---------------------------
:command Bclose bp|bd#
":command YcmStop call youcompleteme#DisableCursorMovedAutocommands()
":command YcmResume call youcompleteme#EnableCursorMovedAutocommands()

noremap <C-n> :NERDTreeToggle <CR>
noremap <F5>  :!make -j4      <CR>
noremap <F6>  :!make -j4 run  <CR>

let mapleader = ","

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

" ============================================================================
"
" PLUGINS CONFIGURATIONS

" Use python venv if available
let g:virtualenv_auto_activate = 1

" Configure powerline status bar
let g:airline_powerline_fonts            = 1
let g:airline_theme                      = 'gotham256'
let g:Powerline_symbols                  = 'fancy'
let g:airline#extensions#tabline#enabled = 1

let g:SuperTabClosePreviewOnPopupClose = 1

"----------------------------------------
" YOUCOMPLETEME PLUGIN CONFIGS
"set completeopt-=preview
"let g:ycm_add_preview_to_completeopt                = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_collect_identifiers_from_tags_files       = 1
"let g:ycm_complete_in_comments                      = 1
"let g:ycm_complete_in_strings                       = 1
"let g:ycm_min_num_of_chars_for_completion           = 0
"let g:ycm_disable_for_files_larger_than_kb          = 30000
"let g:ycm_key_invoke_completion                     = '<C-Space>'
"let g:ycm_path_to_python_interpreter                = 'python3'
"let g:ycm_python_binary_path                        = 'python3'
"let g:ycm_server_python_interpreter                 = 'python3'
"let g:ycm_auto_trigger                              = 1
"let g:ycm_global_ycm_extra_conf                     = '~/.vim/bundle/youcompleteme/.ycm_extra_conf.py'
"set omnifunc=syntaxcomplete#Complete

"----------------------------------------
let g:molokai_original        = 1
let g:javascript_plugin_jsoc  = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

"----------------------------------------
" JEDI CONFIGS
let g:jedi#auto_initialization    = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot           = 1
let g:jedi#popup_select_first     = 1
let g:jedi#show_call_signatures   = "1"

let g:jedi#goto_command             = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command    = "K"
let g:jedi#usages_command           = "<leader>n"
let g:jedi#completions_command      = "<C-K>"
let g:jedi#rename_command           = "<leader>r"

"----------------------------------------
" CLOSETAGS FILETYPES
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.hbs'

"----------------------------------------
let g:go_version_warning = 0

"----------------------------------------
"let g:cpp_function_highlight   = 1
"let g:cpp_attributes_highlight = 1
"let g:cpp_member_highlight     = 1
"let g:cpp_simple_highlight     = 0

set cinoptions=g0,:0,t0,N-s,E-s,(0,ks,(s,m1

" ============================================================================
"
" LSP Options

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()

" Registering LSP Servers
" see also: https://github.com/prabirshrestha/vim-lsp
"if executable('pylsp')
"    " pip install python-lsp-server
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pylsp',
"        \ 'cmd': {server_info->['pylsp']},
"        \ 'allowlist': ['python'],
"        \ })
"endif

if executable('jedi-language-server')
    " pip install jedi-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'jedi-language-server',
        \ 'cmd': {server_info->['jedi-language-server']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ---------------------------
" Lsp Set Debug
"
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

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

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" ============================================================================

" CUSTOM OPTIONS
set tabstop=4
set shiftwidth=4
set hidden
set number
set backspace=indent,eol,start " Allow backspacing over everything in insert mode

set foldopen-=block
" disabled to favor LSP for folding (see LSP Options)
"set foldmethod=indent
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

