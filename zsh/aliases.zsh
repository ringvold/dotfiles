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

alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias tree4='tree -L 4'

alias pfind='ps aux | grep'


# Mac
alias gwd='pwd | pbcopy'
alias zshconfig="open ~/.zshrc"
alias ohmyzsh="open ~/.oh-my-zsh"
alias stp="open *.subl*"

alias v=vagrant
alias railsotto='open "http://$(otto dev address):3000"'


function serve {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}


### ENONIC XP

# list the XP homes
alias xphomes='ls -l ~/code/enonic/xp-homes'

# show the current XP_HOME
alias xpshowhome='echo $XP_HOME'

# set the XP_HOME variable
xpsethome() { export XP_HOME=~/code/enonic/xp-homes/"$1"/home ; }

# start a xp server
xpstart() {
  VERSION=$1
  ~/code/enonic/dist/enonic-xp-${VERSION}/bin/server.sh clean
}

xpget() {
  VERSION=$1
  ENONIC_DIST=~/code/enonic/dist

  zparseopts -D -E -A Args -- f

  if [[ -d ${ENONIC_DIST}/enonic-xp-$VERSION ]] && (( ! ${+Args[-f]} )); then
    echo "Version $VERSION already exsists"
  else
    if [[ ! -a ${ENONIC_DIST}/download/distro-${VERSION}.zip ]]; then
      wget "http://repo.enonic.com/public/com/enonic/xp/distro/$VERSION/distro-$VERSION.zip" \
        -P ${ENONIC_DIST}/download
    fi

    if [[ -d ${ENONIC_DIST}/enonic-xp-${VERSION} ]]; then
      echo "Delete old install"
      rm -rf ${ENONIC_DIST}/enonic-xp-${VERSION}
    fi
    unzip ${ENONIC_DIST}/download/distro-${VERSION}.zip -d ${ENONIC_DIST}
  fi
}

# Go to XP 5.3.1 toolbox
alias xptoolbox531='cd ~/code/enonic/dist/enonic-xp-5.3.1/toolbox'

# Go to XP 6.0.0 toolbox
alias xptoolbox600='cd ~/code/enonic/dist/enonic-xp-6.0.0/toolbox'

# Go to XP snapshot toolbox
# alias xptoolbox='cd /Users/mla/dev/sourcecode/xp/modules/distro/target/install/toolbox'