# Global aliases

alias zshrefresh="source ~/.zshrc"

# Git
alias g=git
alias gs='g status'
alias gau='g add -u .'
alias gun='g reset HEAD'
alias gdc='g diff --cached'
alias fixmerge='git diff --name-only | uniq | xargs subl'

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

alias todos='pt "TODO:" ./ --group --color'

# Homebrew
alias bs="brew search"
alias bi="brew install"

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

