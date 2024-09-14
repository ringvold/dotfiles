{
  description = "Harald's darwin system";

  inputs = {
    # Package sets
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Environment/system management
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
  let
    mkSystem = import ./lib/mksystem.nix;

    inherit (darwin.lib) darwinSystem;
    inherit (inputs.nixpkgs-unstable.lib) attrValues makeOverridable optionalAttrs singleton;

    # Configuration for `nixpkgs`
    nixpkgsConfig = {
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "openssl-1.1.1u"
          "electron-25.9.0"
        ];
      };
      overlays = attrValues self.overlays ++ singleton (
        # Sub in x86 version of packages that don't build on Apple Silicon yet
        final: prev: (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          inherit (final.pkgs-x86)
            nix-index
            niv;
        })
      );
    };

    # overlays
    overlays = [];
  in
  {
    nixosConfigurations.exit = mkSystem "exit" rec {
      inherit overlays nixpkgs home-manager;
      system = "x86_64-linux";
      user = "harald";
    };

    # My `nix-darwin` configs
    darwinConfigurations = rec {
      macbook = darwinSystem {
        system = "aarch64-darwin";
        modules = attrValues self.darwinModules ++ [
          # Main `nix-darwin` config
          ./machines/darwin-configuration.nix
          # `home-manager` module
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            # `home-manager` config
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.harald = import ./users/harald/home-manager.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };

    # Overlays --------------------------------------------------------------- {{{

    overlays = {
      # Overlays to add various packages into package set
      # -- goes here

      # Overlay useful on Macs with Apple Silicon
        apple-silicon = final: prev: optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          # Add access to x86 packages system is running Apple Silicon
          pkgs-x86 = import inputs.nixpkgs-unstable {
            system = "x86_64-darwin";
            inherit (nixpkgsConfig) config;
          };
        };
      };

    # My `nix-darwin` modules that are pending upstream, or patched versions waiting on upstream
    # fixes.
    darwinModules = {

    };
 };
}
