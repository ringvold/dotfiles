{ config, pkgs, inputs, ... }:

{

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "exit";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Oslo";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system (still needed for some X11 apps under Wayland).
  services.xserver.enable = true;

  # Enable the KDE Plasma 6 Desktop Environment with SDDM.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "no";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = ["openssl-1.1.1w" "electron-25.9.0"];

  environment.systemPackages = with pkgs; [
    _1password-gui
    claude-code
    discord
    firefox
    git
    google-chrome
    neovim
    nextcloud-client
    nodejs
    slack
    spotify
    sublime-merge
    vim
    wget
    # KDE extras
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.filelight
    kdePackages.partitionmanager
  ] ++ [
    inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Drop default Plasma apps you don't want.
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa        # music player
    konsole      # terminal — replace with your preferred one if needed
    khelpcenter
  ];

  # Fonts
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    recursive
    nerd-fonts.fira-code
  ];

  programs.zsh.enable = true;

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "26.05";

}
