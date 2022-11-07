# Debug
if [ -v ZSH_DEBUG ]; then
  zmodload zsh/datetime
  setopt PROMPT_SUBST
  PS4='+$EPOCHREALTIME %N:%i> '

  logfile=$(mktemp zsh_profile.XXXXXXXX)
  echo "Logging to $logfile"
  exec 3>&2 2>$logfile

  setopt XTRACE
fi

# Make sure $ZSH_CACHE_DIR is writable, otherwise use a directory in $HOME
if [[ ! -w "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
  source ~/.zshrc_local_before
fi

# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# General shell config
source ~/.dotfiles/shell/bootstrap.sh

# Settings
source ~/.zsh/settings.zsh

# Load lib files
for config_file (~/.zsh/lib/*.zsh); do
  source $config_file
done
unset config_file

# Init zgen
source ~/.zsh/zgen.zsh

# Aliases
source ~/.zsh/aliases.zsh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
  source ~/.zshrc_local_after
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.secrets ]; then
    source ~/.secrets
fi

# Debug end
if [ -v ZSH_DEBUG ]; then
  unsetopt XTRACE
  exec 2>&3 3>&-
fi

# everything after the line should not be here
# (automatically added by scripts)
# ----------------------------------------------

