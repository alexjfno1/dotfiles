# Dotfiles, Setup scripts and Themes

## Install Dotfiles
  1. Apply the Tomorrow Night Eighties Theme (`Tomorrow Night Eighties.itermcolors`)
  2. Clone Nerd Fonts `git clone https://github.com/ryanoasis/nerd-fonts`
  3. `cd nerd-fonts/`
  4. Install Hack font `./install./install.sh Hack`
  5. Set iTerm2 font as `Knack NF`
  6. Run `./setup.sh`
  7. Install [Vundle](https://github.com/VundleVim/Vundle.vim)
  8. Open Vim and run `:BundleInstall`

## Full Mac Setup
  1. [Download](https://www.iterm2.com) and install iTerm2
  2. Install [Brew](https://brew.sh)
  3. Install lastest Git `brew install git`
  4. Install latest Vim `brew install vim` 
  5. Install Tmux `brew install tmux`
  6. Install Reattach To User Namespace `brew install reattach-to-user-namespace`
  7. Follow the steps above to install the dotfiles
  8. Add `export PATH=/usr/local/bin:$PATH` to your .bashrc and restart the terminal
  9. Install your prefered version of Node.js e.g. `nvm install 6`
  10. Install your prefered version of Ruby e.g. `rvm install 4.3.1`
  11. Run `./you-complete-me-setup.sh`

## Colourful terminal prompt
If you would like a colourful more useful terminal prompt copy the following into `~/.bashrc`

```bash
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "- [${BRANCH}${STAT}] - "
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\]\A\[\e[m\] \[\e[31m\]\`parse_git_branch\`\[\e[m\]\[\e[34m\]\w\[\e[m\] => "
```
