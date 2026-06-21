#/usr/bin/env bash
# Used this gist as a setup guide https://gist.github.com/jmatsushita/5c50ef14b4b96cb24ae5268dab613050

if [[ "$1" == "exit" ]]; then
  nix build .#nixosConfigurations.exit.config.system.build.toplevel
  sudo nix-env --profile /nix/var/nix/profiles/system --set ./result
  sudo ./result/bin/switch-to-configuration switch
elif [[ "$1" == "exit-kde" ]]; then
  nix build .#nixosConfigurations.exit-kde.config.system.build.toplevel
  sudo nix-env --profile /nix/var/nix/profiles/system --set ./result
  sudo ./result/bin/switch-to-configuration switch
elif [[ "$1" == bekk ]]; then
  nix build .#darwinConfigurations.bekk-mac-2763.system
  sudo ./result/sw/bin/darwin-rebuild switch --flake .
elif [[ "$1" == macbook ]]; then
  nix build .#darwinConfigurations.macbook.system
  sudo ./result/sw/bin/darwin-rebuild switch --flake .
else
  echo "Unknown configuration name. Valid: exit, exit-kde, bekk, macbook"
fi
