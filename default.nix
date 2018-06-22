{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc843" }:

let
  inherit (nixpkgs) pkgs;
  haskellPackages = pkgs.haskell.packages.${compiler};
  
  overrides = pkgs.haskell.packages.${compiler}.override {
    overrides = self: super:
      with pkgs.haskell.lib;  
      let
        cp = file: (self.callPackage (./nixdeps + "/${file}.nix") {});
      in
      {
        streaming-commons = dontCheck (self.callHackage "streaming-commons" "0.2.0.0" {});
        wai-extra = dontCheck (cp "wai-extra");
        wai-app-static = dontCheck (cp "wai-app-static");
      };
  };
in rec {
  inherit overrides;
  wai-app-static = overrides.wai-app-static;
}
