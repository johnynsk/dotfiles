DIR=`pwd`
ln -s $DIR/.vim ~/.vim
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.i3 ~/.i3
ln -s $DIR/.gitconfig ~/.gitconfig
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/vim-scripts/ultisnips.git ~/.vim/bundle/utilsnips
git clone https://github.com/johnynsk/i3-phpbar.git ~/.i3/i3-phpbar
