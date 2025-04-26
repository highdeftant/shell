" Configuration for vim/Vundle
"  ...
set nocompatible              " required
filetype off                  " required
set number
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ...
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" ... 
" Plugins :
" ...
"
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ...
"	...
" Indent Guide Configuration :
let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guide_start_level = 4
let g:indent_guides_guide_size = 4
set ts=1 sw=8 noet

" Polyglot Configuration :
"
"
"
" ----------------------------
" Airline Configuration :
let g:airline#extensions#tabline#enabled = 1"
"
" -----------------------------
"
" Themes :
" ----------------------------
Plugin 'jaredgorski/spacecamp'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nocksock/bloop-vim'
Plugin 'franbach/miramare'
Plugin 'srcery-colors/srcery-vim'
Plugin 'adrian5/oceanic-next-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'catppuccin/nvim'
" ...
" -------------------------------------------
" Colorscheme Settings...
" -------------------------------------------
" Color Scheme : Miramare
"
" Configuration options: (place before 'colorscheme miramare')
" Numerical settings have a value range of 0, 1
" 
" important!!
"
"let g:miramare_transparent_background = 0
"let g:miramare_enable_italic_string = 0		
"let g:miramare_enable_bold = 1  		" Enable bold in: Type, Function, Constant
"let g:miramare_cursor =                     	" options: auto(D), red, green, blue, purple
"let g:miramare_cursor =                     	" options: auto(D), red, green, blue, purple
"let g:miramare_current_word = 			" options: bold, underline, italic, grey background
"let g:miramare_enable_italic = 0 		" italicized keywords; for used with fonts with cursive italic styles
let g:miramare_disable_italic_comment = 0	" italicized comments
"let g:airline_theme = miramare
"let g:miramare_palette =  			" ex. = {'light_grey': ['#c0c0c0', '245', 'LightGrey']}
" 
" -----------------------------------------
" Color Scheme : Quantum
"
let g:quantum_italics = 1
"
"
"
"
"------------------------------------------
" Color Scheme : Bloop-vim
"
"let g:bloop_set_background = 1
"let g:bloop_use_italics = 0
"
"------------------------------------------
" Color Scheme : Ayu
"
"
"let g:ayu_italic = 1
"let g:ayu_bold = 0 


"
"------------------------------------------
" Color Scheme : Oceanic Next
"let g:oceanic_bold = 1
"let g:oceanic_italic_comments = 1
"------------------------------------------
" Color Scheme : Srcery
"
"let g:srcery_italic = 1
"let g:srcery_bold = 1
"let g:srcery_underline = 0
"let g:srcery_undercurl = 0
"let g:srcery_inverse = 0
"let g:srcery_inverse_matches = 0
"
"
"
"------------------------------------------
packloadall
"
"
"
"
"
"
"All of your Plugins must be added before the following line...
call vundle#end()            " required
filetype plugin indent on    " required
nnoremap <silent> <F2> :NERDTreeToggle ~/<CR>

let g:NERDTreeNodeDelimiter = "\u00a0"
syntax on
set backspace=indent,eol,start
" ...
" split navigations
autocmd FileType python map <buffer> <F3> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F3> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set termguicolors
colorscheme ayu 
