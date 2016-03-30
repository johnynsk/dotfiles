#!/bin/bash

if [[ -z "`cat ~/.bashrc | grep EDITOR`" ]]
then
    echo "export EDITOR=vim" >> ~/.bashrc
    echo "export TERM=xterm-256color" >> ~/.bashrc
fi

mkdir -p ~/.vim/autoload/
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
vim +PluginInstall +qall

if [[ ! -e "`eval echo ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so`" ]]
then
    sudo apt-get -y install python-dev cmake clang
    pushd `pwd`
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --tern-completer --gocode-completer --clang-completer
fi

