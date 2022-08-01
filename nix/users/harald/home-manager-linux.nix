{ config, pkgs, lib, ... }:

{
  imports = [
    ./home-manager.nix
    ./linux.nix
  ];
}
