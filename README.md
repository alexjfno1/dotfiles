# Dotfiles & Dev Setup

1. Import & apply [Mariana colour scheme](./Mariana.itermcolors) for iTerm2
2. [Install Homebrew](https://brew.sh)
3. Install Tmux - `brew install tmux`
4. Install Reattach to User Namespace - `brew install reattach-to-user-namespace`
5. Install Vim - `brew install vim`
6. [Install NVM](https://github.com/nvm-sh/nvm)
7. Setup dotfiles - `./setup.sh`
8. Install Spaceship prompt
9. Install [Git Branch Manager](https://github.com/alexjfno1/git-branch-manager)
10. Add Spaceship prompt settings to `~/.zshrc`:

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
