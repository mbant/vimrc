""" VIM config file - MB
set nocompatible
let mapleader = ','

"""""" Visual settings """"""""""""""
" automatic syntax highlighting
syntax enable

" Turn ruler on
set ruler

colorscheme delek
if has("gui_running")
	colorscheme desert
	"set guifont=Bitstream\ Vera\ Sans\ Mono\ 13
	set guifont=Liberation\ Mono\ for\ Powerline\ 15
    set go=
else
	set t_Co=256
end

set termencoding=utf-8
set encoding=utf-8

" autohighlight leading/trailing whitespaces
highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

"""""" Mini buffer explorer """""""""
let g:miniBufExplBRSplit = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMaxSize = 30
"let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplBuffersNeeded=2


"""""" Filetype-specific hacks """"""
filetype plugin indent on

" C options
autocmd BufEnter *.i  :set filetype=cpp " These are usually SWIG files for me

"" Settings for latex suite.
" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
:let g:tex_flavor="latex"

" Makefiles
autocmd BufEnter Makefile* :set filetype=make

"""""" CTags and tag list """"""""""""""""""""""
command MkTags :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .


"""""" OmniCppComplete """""""""""""""""""""""""
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2 " 2: included 1: this file only
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

let g:syntastic_mode_map = { 'mode': 'active',
						   \ 'active_filetypes': [],
						   \ 'passive_filetypes': ['python'] }

let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\m^/usr/include/', '\m^/usr/lib/']

"""""" Airline """"""""""""""""""""""""""""""""
if has("gui_running")
	let g:airline_powerline_fonts = 1
end
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2


"""""" Pathogen """"""""""""""""""""""""""""""""
call pathogen#infect()

"""""" Random features """"""""
set ignorecase smartcase
set foldmethod=syntax
set nofoldenable
set hidden

source $VIMRUNTIME/macros/matchit.vim

""" Jedi
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 0 " Disable popup with arguments


" automatic folding
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" Make sure vim checks for 'set commands' in opened files
set modeline
set modelines=3

" Prefer to break at words
set linebreak

set clipboard=unnamedplus
""""""""""""""""""""""""""""
