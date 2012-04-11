#### EXPORTS ####

# jre javahome
export JAVA_HOME=/opt/java/
# openjdk javahome
# export JAVA_HOME=/usr	
export TERM=xterm-256color
export EDITOR=vim
export PATH=$PATH:/home/harald/.gem/ruby/1.9.1/bin

# Check for an interactive session
#[ -z "$PS1" ] && return

# setting up solarized dircolors
eval `dircolors ~/scripts/dircolors-solarized/dircolors.256dark `


#### ALIAS ####

# autocomple with sudo
#complete -cf sudo
alias sudo='sudo -E'

# todo.sh (todo.txt)
alias t='todo.sh'

# open this
alias aalias='open /home/harald/.omz/aliases.zsh &'

# php
alias php='/opt/lampp/bin/php'

# zf
alias zf='/media/data/dev/php/zendsvn/bin/zf.sh'

# Yaourt
alias y='yaourt'

# yaourt search
alias ys='yaourt -Ss'

# yaourt install
alias yi='yaourt --noconfirm -S'

# yaourt remove
alias yr='sudo pacman -R'

# Update system
#alias yup='yaourt --noconfirm -Syyu --aur'
alias yupaur='packer -Syu --auronly'
alias yupdev='packer -Syu --devel'

# ls
alias la='ls -a'
alias ll='ls -la'
alias ls='ls --color=auto'

# Pacman mirror update
alias mirrorupdate='sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist'
# gnome-open
alias open='gnome-open'

# ps -A | grep 
alias isrunning='ps -A | grep'

# Folder size list. sorted.
alias foldersize="du --max-depth=1|sort -n|cut -f2|tr '\n' '\0'|xargs -0 du -sh 2>/dev/null"

## SHH ##

# sshproxy
alias sshproxy='ssh -ND 8080 ringvold.nu&'

# battery drain
alias batterydrain='upower -i /org/freedesktop/UPower/devices/battery_BAT0|grep energy-rate'

# adb
alias adb='sudo /opt/android-sdk/tools/adb'

## Alert when command is done
alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "Kommando ferdig" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/;\s*alert$//'\'')"'

## cpufreq
alias setcpugovpowersave='sudo cpufreq-set -c 0 -g powersave; sudo cpufreq-set -c 1 -g powersave; sudo cpufreq-set -c 2 -g powersave; sudo cpufreq-set -c 3 -g powersave'
alias setcpugovondemand='sudo cpufreq-set -c 0 -g ondemand; sudo cpufreq-set -c 1 -g ondemand; sudo cpufreq-set -c 2 -g ondemand; sudo cpufreq-set -c 3 -g ondemand'
alias setcpugovperformance='sudo cpufreq-set -c 0 -g performance; sudo cpufreq-set -c 1 -g performance; sudo cpufreq-set -c 2 -g performance; sudo cpufreq-set -c 3 -g performance'
alias viewfreq='watch grep \"cpu MHz\" /proc/cpuinfo'

# Simulates an installation
alias install-stuff='j=0;while true; do let j=$j+1; for i in $(seq 0 20 100); do echo $i;sleep 1; done | dialog --gauge "Install part $j : `sed $(perl -e "print int rand(99999)")"q;d" /usr/share/dict/words`" 6 40;done'


## stop og start networkmanager
alias stopnetworkmanager='sudo /etc/rc.d/networkmanager stop'
alias startnetworkmanager='sudo /etc/rc.d/networkmanager start'

## stop og start wicd
alias stopwicd='sudo /etc/rc.d/wicd stop; sudo killall wicd-client'
alias startwicd='sudo wicd; wicd-client&'
