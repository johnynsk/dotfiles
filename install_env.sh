DIR=`pwd`
ln -s $DIR/.vim ~/.vim
ln -s $DIR/.config ~/.config/apps
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.gitconfig ~/.gitconfig
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/vim-scripts/ultisnips.git ~/.vim/bundle/utilsnips
