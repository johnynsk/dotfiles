execute pathogen#infect()

source ~/.vim/php-doc.vim

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

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

call vundle#end()

" -----------------------------------------
" map keys
" -----------------------------------------
nnoremap <F4> :set nonumber!<CR>
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


filetype plugin indent on

autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR> 
autocmd	FileType php set omnifunc=phpcomplete#CompletePHP

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

" airline plugin
set laststatus=2
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1

highlight LineNr ctermfg=darkgray ctermbg=black
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

filetype plugin on
