syntax on
set t_Co=256
set path+=**
set wildmenu
set relativenumber

exec "set listchars=tab:\\ \\ ,trail:·,extends:→,precedes:←"

" example: ├┈┈┈├┈┈┈sometext·······      
"exec "set listchars=tab:\u251c\u2508,trail:·,extends:→,precedes:←"

" example:|   |   sometext·······
"exec "set listchars=tab:\\|\\ ,trail:·,extends:→,precedes:←"

" example:|»»»|»»»sometext·······      
"exec "set listchars=tab:\\|\uBB,trail:·,extends:→,precedes:←"

" This turns it on:
set list


" Read an empty HTML template and move cursor to title!!
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>7GA

" Signature file:
nnoremap ,sig :-1read $HOME/.signature<CR>k

	if version >= 800
		if &term =~ "xterm" || "screen" || "screen-256color"
			"let &t_SI = "\<Esc>]12;purple\x7"
			let &t_SI = "\<Esc>]12;green\x7"	"insert mode
			let &t_SR = "\<Esc>]12;red\x7"		"replace mode
			let &t_EI = "\<Esc>]12;white\x7"	"normal mode
		endif
    endif

colorscheme monokai
"colorscheme codedark
"colorscheme molokai
"colorscheme jellybeans
"colorscheme gruvbox
"colorscheme vividchalk

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
"""set expandtab
""""""""VUNDLE STUFF"""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
if version >= 801
	Plugin 'fatih/vim-go'
endif


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
set updatetime=100 "This causes statusline to update in 100ms instead of the default 800ms
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info=1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

set history=1000

map <F8> :setlocal spell! spelllang=en_us<CR>
map <F3> "=system(genpassword)<C-M>




nnoremap <F5> :set listchars=tab:\ \ ,trail:·,extends:→,precedes:← <CR>
inoremap <F5> <ESC> :set listchars=tab:\ \ ,trail:·,extends:→,precedes:← <CR>a
nnoremap <F6> :set listchars=tab:├┈,trail:·,extends:→,precedes:← <CR>
inoremap <F6> <ESC> :set listchars=tab:├┈,trail:·,extends:→,precedes:← <CR>a
nnoremap <F7> :set list<CR>
inoremap <F7> <ESC>:set list<CR>a

set pastetoggle=<F2>

"set laststatus=2

"set background=dark

hi User1 ctermfg=Red ctermbg=DarkGray	
hi User2 ctermfg=White ctermbg=DarkGray
hi User3 ctermfg=White ctermbg=DarkBlue
hi User4 ctermfg=Cyan ctermbg=DarkGray
hi User5 ctermfg=Gray ctermbg=DarkGray
hi User6 ctermfg=DarkGreen ctermbg=DarkGray
hi User7 ctermfg=DarkMagenta ctermbg=DarkGray
hi User8 ctermfg=Black ctermbg=DarkGray
hi User9 ctermfg=LightGray ctermbg=DarkGray
"hi statusline ctermfg=DarkGray 		
" ctermbg=Black


"set statusline=
"set statusline +=%2*\ [%1*%n%2*]\ %*      	"buffer number
"set statusline +=%6*%{&ff}%*      	"file format
"set statusline +=%7*%y\ %*          	"file type
"set statusline +=\|%*%3*%<%F%*\|%* 	"full path
""set statusline+=%-40f\           	"path 
""set statusline +=\ %2*%m%*         	"modified flag
"set statusline +=\ %2*%h%m%r%w%*	"flags" 
"set statusline +=%=			"RIGHT align
"set statusline +=%5*\[0x%02B\ %03b\]%* 	"character under cursor
"set statusline +=%2*\ \[%*%1*%{v:register}%*%2*\]%*	"which copy/paste buffer active
"set statusline +=\ \ %2*(%*%9*%v\ %*        		"virtual column number
"set statusline +=%l        	"current line
"set statusline +=%2*/%L)%*          	"total lines
"set statusline +=%3p%%                	"percentage of file



