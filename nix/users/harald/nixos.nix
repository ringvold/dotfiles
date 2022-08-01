{ pkgs, ... }:

{
  users.users.harald = {
    isNormalUser = true;
    home = "/home/harald";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$npsUsmLRkW2mdvht$VxMxaMhMcr52BIOIfFq9CKouQwEosRrgeT9/voFORp8xUIIVe85Wfq.Bc/TMyFoEEH62uB9ucjCtXhwq2NLiV/";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOXtV186CXLgzPn4BQPEnZy3Ot4aukMJ/kQ1xyldVCzj harald"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix;
}
