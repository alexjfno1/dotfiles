#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
mkdir -p ~/.vim/colors
cp ${BASEDIR}/Tomorrow-Night-Eighties.vim ~/.vim/colors/

# Tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/tmux.conf.local ~/.tmux.conf.local

# Git Config
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
