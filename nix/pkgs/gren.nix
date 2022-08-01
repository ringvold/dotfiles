{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "gren";
  src = pkgs.fetchurl {
    url = "https://github.com/gren-lang/compiler/releases/download/v0.1.0/gren_mac";
    sha256 = "01sa9yv19gq8yl01gbr0pf8x3pkjaqnnnlzkkg20j0fmx7r8s53l";
  };
  phases = ["installPhase" "patchPhase"];
  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/gren
    chmod +x $out/bin/gren
  '';
}
