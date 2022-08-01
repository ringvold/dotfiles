{ config, pkgs, lib, ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      overlay-key = "Super_R";
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = [ "terminate:ctrl_alt_bksp" "lv3:caps_switch"];
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
    };

    gtk3.extraConfig = { gtk-application-prefer-dark-theme = 0; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = 0; };
  };

  # Misc configuration files --------------------------------------------------------------------
  xdg.configFile."terminator/config".text = builtins.readFile ./terminator;
}
