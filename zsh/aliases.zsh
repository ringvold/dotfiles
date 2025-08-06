# Global aliases

alias zshrefresh="source $ZDOTDIR/.zshrc"
alias uke='date +%V'
alias isodate="date +'%Y-%m-%dT%H:%M:%SZ'"
alias vim=nvim

# Nix
alias drb="darwin-rebuild build"
alias drs="darwin-rebuild switch"

# Git
alias g=git
alias gs='g status'
alias gau='g add -u .'
alias gun='g reset HEAD'
alias gdc='g diff --cached'
alias gwtb='g worktree add -b'
alias gwta='g worktree add'
alias gwtr='g worktree remove'
alias fixmerge='git diff --name-only | uniq | xargs subl'
alias gci='git checkout $(git branch | fzf)'
alias gcia='git checkout $(git branch -a | fzf)'
alias gdi='git branch -D $(git branch -a | fzf)'

# Maven
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests'

# Gradle
alias gw=./gradlew

# Tree
alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias tree4='tree -L 4'

alias pfind='ps aux | grep'

alias todos='rg "TODO:"'

# Homebrew
alias bs="brew search"
alias bi="brew install"
alias b="brew"
alias bupg="brew upgrade"

# Other
alias dcdb="docker compose up db"

alias claude="/Users/harald/.claude/local/claude"


# OSX or not
if [[ `uname` == "Darwin" ]]; then
  alias open=open
else
  alias open=xdg-open
fi

# Functions

function serve {
  port=":${1:-8080}"
  caddy file-server --browse --listen $port
}

function wgup {
  sudo wg-quick up ${1:-home}
}

function wgdown {
  sudo wg-quick down ${1:-home}
}


