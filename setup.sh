#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# Tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf

# Git Config
ln -s ${BASEDIR}/gitconfig ~/.gitconfig

# Tern Config ( YouCompleteMe )
ln -s ${BASEDIR}/tern-config ~/.tern-config
