source ~/.vim/php-doc.vim
set nocompatible              " be iMproved, required
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
"
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR> 

set hls
set is
" :map <F7>
" if exists("syntax_on")
" syntax off 
" else 
" syntax enable
" endif
set expandtab
set cul
set autoindent
"set nu
set number
nnoremap <F4> :set nonumber!<CR>
highlight LineNr ctermfg=darkgray ctermbg=black
" set background=dark
"highlight Normal ctermbg=darkgray
"set smartindent
syntax on
set pastetoggle=<F8>
" http://dev-mark.blogspot.com/2010/12/vim.html
" edited tabulation
set tabstop=4
set softtabstop=4
"set noexpandtab
set shiftwidth=4
nmap j gj
nmap <DOWN> gj
nmap k gk
nmap <UP> gk
set ignorecase
set mouse=a
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
set showtabline=4
autocmd	FileType	php	set	omnifunc=phpcomplete#CompletePHP
"autocmd FileType	css	set	omnifunc=csscomplete#CompleteCSS
"autocmd	FileType	html	set	omnifunc=htmlcomplete#CompleteTags
"autocmd	FileType	javascript	set	omnifunc=javascriptcomplete#CompleteJS
"autocmd	FileType	xml	set	omnifunc=xmlcomplete#CompleteTags
"autocmd	FileType	c	set	omnifunc=ccomplete#Complete
"filetype plugin on
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete

