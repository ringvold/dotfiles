# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sublime
    zgen load zsh-users/zsh-syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    # save all to init script
    zgen save
fi
