#/usr/bin/env bash
# Used this gist as a setup guide https://gist.github.com/jmatsushita/5c50ef14b4b96cb24ae5268dab613050

if [[ "$1" == "exit" ]]; then
  nix build .#nixosConfigurations.exit.config.system.build.toplevel
elif [[ "$1" == bekk ]]; then
  nix build .#darwinConfigurations.bekk-mac-2763.system
else
  echo "Unknown configuration name. Valid: exit, bekk"
fi
