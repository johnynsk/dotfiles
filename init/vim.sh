#!/bin/bash
echo "export EDITOR=vim" >> ~/.bashrc
echo "export TERM=xterm-256color" >> ~/.bashrc
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
vim +PluginInstall +qall
