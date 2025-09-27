{
  description = "dog";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, utils, ...}:
    utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages.${system};
      in 
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            ghc
            zlib
            cabal-install
          ];
        };
      }
    );

}
