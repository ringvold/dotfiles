# load zgen
#source "${HOME}/.dotfiles/zgen/zgen.zsh"
source "${HOME}/.zgenom/zgenom.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sublime
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/docker
    zgen load zdharma/fast-syntax-highlighting
    zgen load mroth/evalcache

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    # Add or override plugins locally
    if [ -f ~/.zgen_local ]; then
        source ~/.zgen_local
    fi

    # save all to init script
    zgen save

    zgenom compile "$HOME/.zshrc"
    zgenom compile $ZDOTDIR
fi
