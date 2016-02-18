#!/bin/bash
DIR=`pwd`
ln -s ${DIR}/.vim ~/.vim
ln -s ${DIR}/.config ~/.config
ln -s ${DIR}/.vimrc ~/.vimrc
ln -s ${DIR}/.zshrc ~/.zshrc
ln -s ${DIR}/.gitconfig ~/.gitconfig

echo "Настраиваю vim"
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/vim-scripts/ultisnips.git ~/.vim/bundle/utilsnips

echo "Настраиваю git"
git config --global core.excludesfile '~/.config/git/gitignore'
