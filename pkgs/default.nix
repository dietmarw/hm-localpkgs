# Custom packages, that can be defined similarly to ones from nixpkgs
# Build them using 'nix build .#example'
pkgs: {
  bsync = pkgs.callPackage ./bsync { };
  }