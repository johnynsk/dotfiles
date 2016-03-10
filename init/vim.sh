#!/bin/bash
echo "export EDITOR=vim" >> ~/.bashrc
echo "export TERM=xterm-256color" >> ~/.bashrc
mkdir -p ~/.vim/autoload/
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
vim +PluginInstall +qall

sudo apt-get install python-dev
pushd `pwd`
cd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer --gocode-completer --clang-completer

