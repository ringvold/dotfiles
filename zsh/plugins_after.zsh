# External plugins (initialized after)

# Set up fasd
source ~/.dotfiles/fasd/fasd
_evalcache fasd --init posix-alias zsh-hook
alias j=z

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv
eval "$(direnv hook zsh)"
