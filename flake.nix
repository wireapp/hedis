{
  description = "Dev Setup";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {nixpkgs, flake-utils, ...}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        ghcOverrides = hself: hsuper: rec {
          crypton-x509-validation = hsuper.callPackage ./crypton-x509-validation.nix {};
          hedis = hsuper.callPackage ./default.nix {};
        };
        ghc94Pkgs = pkgs.haskell.packages.ghc94.override {
          overrides = ghcOverrides;
        };
      in rec {
        packages = rec {
          dev-env = ghc94Pkgs.shellFor {
            packages = p: [p.hedis];
            buildInputs = [
              pkgs.haskellPackages.cabal-install
              (pkgs.haskell-language-server.override {supportedGhcVersions = ["94"];})
              pkgs.haskellPackages.implicit-hie
              pkgs.cabal2nix

              # For cabal
              pkgs.pkg-config
              pkgs.binutils

              # For CI
              pkgs.jq
              pkgs.dhall
              pkgs.dhall-json
              pkgs.fly
              pkgs.redis
            ];
          };
          hedis-ghc94 = ghc94Pkgs.hedis;
        };
        defaultPackage = packages.dev-env;
    });
}
