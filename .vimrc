execute pathogen#infect()

"Helptags vim-fugitive/doc
set nocompatible
filetype off

" -----------------------------------------
" Vundle installation
" -----------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " need to keep vundle directory

" Syntax support
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'nginx.vim'
Plugin 'fatih/vim-go'
Plugin 'isRuslan/vim-es6'
Plugin 'IN3D/vim-raml'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/xml.vim' "helps editing xml
" awesome syntax checking plugin
Plugin 'vim-syntastic/syntastic'

" Interface extenders
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive' "shows git branch

" Interface themes
Plugin 'NLKNguyen/papercolor-theme'

" понять и простить
Plugin 'godlygeek/tabular'

" became useless plugins
" Bundle 'tobyS/pdv' " php documentor vim
" Plugin 'ultisnips'
"autocomplete
"Bundle 'vim-scripts/proc.vim'
" Bundle 'Shougo/vimproc'
" Bundle 'Shougo/unite.vim'
" Bundle 'm2mdas/phpcomplete-extended'

"xdebug
"Plugin 'joonty/vdebug'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
call vundle#end()

" -----------------------------------------
" map keys
" -----------------------------------------

" toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" toggle line numbers and other information
function ToggleLines()
    :set nonumber!
    :GitGutterSignsToggle
endfunction
nnoremap <F4> :call ToggleLines()<CR>
set number

" mouse control toggle define
nnoremap <F3> :call ToggleMouse()<CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunction
set mouse=a

" working with tabs: previous and next
nnoremap <F9> gT
nnoremap <F10> gt

" paste mode toggle
set pastetoggle=<F8>

" mapping for human-moving between lines
nmap j gj
nmap <DOWN> gj
nmap k gk
nmap <UP> gk

" -----------------------------------------
" options
" -----------------------------------------
set is
set cul
syntax on


" tabs settings
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showtabline=4
set ignorecase
set autoindent
autocmd BufWritePre * StripWhitespace

" need to know how it works
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete

" --------------------------------
"  Interface
" --------------------------------
" theme settings with line numbers
set background=light
colorscheme PaperColor
highlight LineNr ctermfg=darkgray ctermbg=black

" search highlights
set hls " highlights search results
:hi Search ctermbg=70

set exrc
set secure


" airline plugin
set laststatus=2
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|.idea\|.git'
"let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" overlength > 120
highlight OverLength ctermfg=red guibg=#592929
match OverLength /\%121v.\+/

filetype plugin indent on

nnoremap	<F9>	gT
nnoremap	<F10>	gt

let path=",./,"
