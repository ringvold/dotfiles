#/usr/env sh
# Used this gist as a setup guide https://gist.github.com/jmatsushita/5c50ef14b4b96cb24ae5268dab613050

nix build .#darwinConfigurations.bekk-mac-2763.system
./result/sw/bin/darwin-rebuild switch --flake .
