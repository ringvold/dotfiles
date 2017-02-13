# Global aliases

alias zshrefresh="source ~/.zshrc"

# Git
alias g=hub
alias gs='g status'
alias gau='g add -u .'
alias gun='g reset HEAD'
alias gdc='g diff --cached'
alias fixmerge='git diff --name-only | uniq | xargs subl'

# Maven
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests'

alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias tree4='tree -L 4'

alias pfind='ps aux | grep'

alias v=vagrant

alias todos='pt "TODO:" ./ --group --color'


function serve {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}


