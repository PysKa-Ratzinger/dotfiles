set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'TroyFletcher/vim-colors-synthwave'
Plugin 'alvan/vim-closetag'
Plugin 'agude/vim-eldar'
Plugin 'davidhalter/jedi-vim'
Plugin 'embear/vim-localvimrc'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'koirand/tokyo-metro.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/DoxygenToolkit.vim'

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

map <C-n> :NERDTreeToggle<CR>

set tabstop=8
set shiftwidth=8
set hidden
set number
set t_Co=256

set foldopen-=block

if exists('+colorcolumn')
  set colorcolumn=80
endif
syntax on

colorscheme tokyo-metro

set completeopt-=preview

:command Bclose bp|bd#
:command YcmStop call youcompleteme#DisableCursorMovedAutocommands()
:command YcmResume call youcompleteme#EnableCursorMovedAutocommands()

:imap <buffer> ;struct <C-O>mzstruct %%% {<CR>%%%<CR><BS><BS>};<C-O>'z;;
:imap <buffer> ;main <C-O>mzint main (int argc, char* argv[]) {<CR>%%%<CR><BS><BS>}<C-O>'z;;
:imap <buffer> ;wh <C-O>mzwhile (%%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;
:imap <buffer> ;fo <C-O>mzfor (%%%; %%%; %%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;
:imap <buffer> ;; <C-O>/%%%<CR><C-O>c3l
:nmap <buffer> ;; /%%%<CR>c3l

let g:airline_powerline_fonts = 1
let g:airline_theme='badcat'
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1

let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_python_binary_path = '/usr/bin/python2'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:SuperTabClosePreviewOnPopupClose = 1

let g:molokai_original = 1
let g:javascript_plugin_jsoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:jedi#auto_initialization = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "1"

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

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
			elseif incomment
				== 0
				if cline
					=~
					'^\s*\S\+'
					return
					cindent(a:lnum)
				endif
			endif
		endfor
		return
		cindent(nsLineNum)
	endif
endfunction

