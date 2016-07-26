alias zshrefresh="source ~/.zshrc"

# Git
alias g=hub
alias gs='g status'
alias gau='g add -u .'
alias gun='g reset HEAD'
alias gdc='g diff --cached'
alias fix='git diff --name-only | uniq | xargs subl'

# Maven
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests'

# Mac
alias gwd='pwd | pbcopy'
alias zshconfig="open ~/.zshrc"
alias ohmyzsh="open ~/.oh-my-zsh"
alias stp="open *.subl*"

alias v=vagrant
alias railsotto='open "http://$(otto dev address):3000"'

alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias tree4='tree -L 4'


function serve {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}


### ENONIC XP

# start XP 5.3.1
alias xpstart531='~/code/enonic/dist/enonic-xp-5.3.1/bin/server.sh clean'

# start XP 6.0.0
alias xpstart600='~/code/enonic/dist/enonic-xp-6.0.0/bin/server.sh clean'

# start XP 6.1.1
alias xpstart611='~/code/enonic/dist/enonic-xp-6.1.1/bin/server.sh clean'

# start XP 6.2.0
alias xpstart620='~/code/enonic/dist/enonic-xp-6.2.0/bin/server.sh clean'

# start XP 6.3.0
alias xpstart630='~/code/enonic/dist/enonic-xp-6.3.0/bin/server.sh clean'

# start the XP snapshot
# alias xpstart='/Users/mla/dev/sourcecode/xp/modules/distro/target/install/bin/server.sh clean'

# list the XP homes
alias xphomes='ls -l ~/code/enonic/xp-homes'

# show the current XP_HOME
alias xpshowhome='echo $XP_HOME'

# set the XP_HOME variable
xpsethome() { export XP_HOME=~/code/enonic/xp-homes/"$1"/home ; }

# Go to XP 5.3.1 toolbox
alias xptoolbox531='cd ~/code/enonic/dist/enonic-xp-5.3.1/toolbox'

# Go to XP 6.0.0 toolbox
alias xptoolbox600='cd ~/code/enonic/dist/enonic-xp-6.0.0/toolbox'

# Go to XP snapshot toolbox
# alias xptoolbox='cd /Users/mla/dev/sourcecode/xp/modules/distro/target/install/toolbox'