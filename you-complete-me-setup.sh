#!/bin/bash

# Install XCode dev tools
xcode-select --install

# Install CMake
brew install cmake

# Install YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer
