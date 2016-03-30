execute pathogen#infect()

set nocompatible
filetype off

" -----------------------------------------
" Vundle installation
" -----------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'tobyS/pdv'
Plugin 'gmarik/Vundle.vim'
Plugin 'ultisnips'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'nginx.vim'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

call vundle#end()

" -----------------------------------------
" map keys
" -----------------------------------------
nnoremap <F4> :call ToggleLines()<CR>
map <C-n> :NERDTreeToggle<CR>
function ToggleLines()
    :set nonumber!
    :GitGutterSignsToggle
endfunction

nnoremap <F3> :call ToggleMouse()<CR>
function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
	else
		set mouse=a
	endif
endfunction
nnoremap	<F9>	gT
nnoremap	<F10>	gt
nmap j gj
nmap <DOWN> gj
nmap k gk
nmap <UP> gk
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>



filetype plugin indent on

" -----------------------------------------
" options
" -----------------------------------------
set hls
set is
set expandtab
set cul
set autoindent
set number
syntax on
set pastetoggle=<F8>
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ignorecase
set mouse=a
set showtabline=4
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete
:hi Search ctermbg=70


" airline plugin
set laststatus=2
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1

highlight LineNr ctermfg=darkgray ctermbg=black

" overlength > 120
highlight OverLength ctermfg=red guibg=#592929
match OverLength /\%121v.\+/

filetype plugin on

autocmd BufWritePre * StripWhitespace

