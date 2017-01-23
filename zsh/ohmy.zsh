# Configure and start Oh My Zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Use Babun the if in Babun (shell gets much faster!)
if type babun > /dev/null; then
  ZSH_THEME="babun"
else
  ZSH_THEME="apple"
fi

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(git hub golang brew autojump sublime)

# Add or override plugins locally
if [ -f ~/ohmyzsh_plugins_local_after ]; then
    source ~/.ohmyzsh_plugins_local_after
fi

source $ZSH/oh-my-zsh.sh
