# Dotfiles & Dev Setup

1. Import & apply [Mariana colour scheme](./Mariana.itermcolors) for iTerm2
2. Install & apply Hack font to iTerm2 - `brew install homebrew/cask-fonts/font-hack`
3. [Install Homebrew](https://brew.sh)
4. Install Tmux - `brew install tmux`
5. Install Reattach to User Namespace - `brew install reattach-to-user-namespace`
6. Install Vim - `brew install vim`
7. Install Spaceship prompt - `brew install spaceship`
8. [Install NVM](https://github.com/nvm-sh/nvm)
9. Install [Git Branch Manager](https://github.com/alexjfno1/git-branch-manager)
10. Setup dotfiles - `./setup.sh`
11. Add Spaceship prompt settings to `~/.zshrc`:

```
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

export SPACESHIP_PROMPT_ADD_NEWLINE=false
export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  exec_time     # Execution time
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

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
```

11. Add Aliases to `~/.zshrc`:

```
# Aliases
alias ls="ls -lhaG"
alias g="git-branch-manager"
```
