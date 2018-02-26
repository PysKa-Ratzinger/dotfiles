set nocompatible
filetype off
set encoding=UTF-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'TroyFletcher/vim-colors-synthwave'
"Plugin 'agude/vim-eldar'
Plugin 'alvan/vim-closetag'
Plugin 'davidhalter/jedi-vim'
Plugin 'embear/vim-localvimrc'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'fatih/vim-go'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'koirand/tokyo-metro.vim'
"Plugin 'leafgarland/typescript-vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'tikhomirov/vim-glsl'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'huyvohcmc/atlas.vim'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'dylanaraps/wal.vim'

" Snippets plugin
"Plugin 'SirVer/ultisnips'

" Plugins added for work with PHP (still ended up using phpstorm :P )
Plugin 'mhinz/vim-startify'
"Plugin 'tobyS/vmustache'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

noremap <C-n> :NERDTreeToggle <CR>
noremap <F5>  :!make -j4      <CR>
noremap <F6>  :!make -j4 run  <CR>

set tabstop=8
set shiftwidth=8
set hidden
set number
set backspace=indent,eol,start " Allow backspacing over everything in insert mode

set foldopen-=block
set foldmethod=indent
set foldlevelstart=0
set nofoldenable

set timeout timeoutlen=1000

"Disable mouse
set mouse=

if exists('+colorcolumn')
  set colorcolumn=80
endif
syntax on

set t_Co=256

"set bg=dark
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
" colorscheme badwolf
" colorscheme 1989
" colorscheme neonwave
" colorscheme gruvbox
" colorscheme Chasing_Logic
" colorscheme ayu
" colorscheme apprentice
" colorscheme sonokai
colorscheme termschool
" colorscheme wal

:hi Normal guibg=NONE ctermbg=NONE

set completeopt-=preview

:command Bclose bp|bd#
:command YcmStop call youcompleteme#DisableCursorMovedAutocommands()
:command YcmResume call youcompleteme#EnableCursorMovedAutocommands()

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

let g:virtualenv_auto_activate = 1

let g:airline_powerline_fonts            = 1
let g:airline_theme                      = 'gotham256'
let g:Powerline_symbols                  = 'fancy'
let g:airline#extensions#tabline#enabled = 1

let g:SuperTabClosePreviewOnPopupClose = 1

let g:ycm_add_preview_to_completeopt                = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files       = 1
let g:ycm_complete_in_comments                      = 1
let g:ycm_complete_in_strings                       = 1
let g:ycm_min_num_of_chars_for_completion           = 0
let g:ycm_disable_for_files_larger_than_kb          = 30000
let g:ycm_key_invoke_completion                     = '<C-Space>'
let g:ycm_path_to_python_interpreter                = 'python3'
let g:ycm_python_binary_path                        = 'python3'
let g:ycm_server_python_interpreter                 = 'python3'
let g:ycm_auto_trigger                              = 1
let g:ycm_global_ycm_extra_conf                     = '~/.vim/bundle/youcompleteme/.ycm_extra_conf.py'

set omnifunc=syntaxcomplete#Complete

let g:molokai_original        = 1
let g:javascript_plugin_jsoc  = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

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

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

let g:go_version_warning = 0

let g:cpp_function_highlight   = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight     = 1
let g:cpp_simple_highlight     = 0

set cinoptions=:0,t0

" Fix up indent issues - I can't stand wasting an indent because
" I'm in a namespace. If you don't like this then just comment
" this line out.
setlocal indentexpr=GetCppIndentNoNamespace(v:lnum)

"
" GetCppIndentNoNamespace()
"
" This little function calculates the indent level for C++ and
" treats the namespace differently than usual - we ignore it. The
" indent level is the for a given line is the same as it would
" be were the namespace not event there.
"
" This function is rather crude but it works.
"
function! GetCppIndentNoNamespace(lnum)
	let nsLineNum = search('^\s*\\s\+\S\+', 'bnW')
	if nsLineNum == 0
		return cindent(a:lnum)
	else
		let incomment = 0
		for n in range(nsLineNum + 1, a:lnum - 1)
			let cline = getline(n)
			if cline =~ '^\s*/\*'
				let incomment = 1
			elseif cline =~ '^.*\*/'
				let incomment = 0
			elseif incomment == 0
				if cline =~ '^\s*\S\+'
					return cindent(a:lnum)
				endif
			endif
		endfor
		return
		cindent(nsLineNum)
	endif
endfunction

