{ config, pkgs, lib, ... }:

{
  home.stateVersion = "22.05";

  # https://github.com/malob/nixpkgs/blob/master/home/default.nix

  home.packages = with pkgs; [
    # Some basics
    coreutils
    curl
    wget
    ripgrep
    fd
    bat
    python3

    obsidian
    _1password-cli

    # Dev stuff
    asdf-vm
    jq
#    gren
    direnv
    nix-direnv
    docker
    docker-compose

    # Useful nix related tools
    cachix # adding/managing alternative binary caches hosted by Cachix
    comma # run software from without installing it

    # (nerdfonts.override { fonts = [ "FiraCode" ]; })

  ] ++ lib.optionals stdenv.isDarwin [
    cocoapods
    m-cli # useful macOS CLI commands
  ];

  # fonts
  # fonts.fontconfig.enable = true;

  # programs.atuin = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   flags = [
  #     "--disable-up-arrow"
  #   ];
  # };

  # zsh is managed by dotbot (~/.zshenv and ~/.config/zsh symlink to dotfiles repo),
  # so we don't enable programs.zsh here.

  # programs.direnv = {
  #     enable = true;
  #     #enableZshIntegration = true;
  #     nix-direnv.enable = true;
  #   };

  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  programs.nix-index.enable = false;

  # nvim config managed by dotbot.
}
