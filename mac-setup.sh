#!/bin/bash

# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Vim
brew install vim

# Install Tmux
brew install tmux
brew install reattach-to-user-namespace

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

# Install Ruby
curl -sSL https://get.rvm.io | bash -s stable

# Next Steps
echo "Next steps:"
echo "1. Apply the iTerm2 colour scheme Tomorrow Night Eighties in the dotfile root"
echo "2. Install and set the iTerm 2 font as Hack found in ./HackFonts"
echo "3. Add 'export PATH=/usr/local/bin:$PATH' to your .bashrc and restart the terminal"
echo "4. Open Vim and :BundleInstall"
echo "5. Install your prefered version on Node.js e.g. nvm install 6"
echo "6. Install your prefered version of ruby e.g. rvm install 2.3.1"
echo "7. Run ./you-complete-me-setup.sh"
