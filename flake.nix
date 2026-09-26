{
  description = "Secret scanner for Git.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nox.url = "github:playfairs/nox";
  };

  outputs =
    { self, nixpkgs, nox }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = function: nixpkgs.lib.genAttrs systems (system: function nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            nox.packages.${pkgs.system}.default
            pkgs.haskell-language-server
            pkgs.ghc
          ];
        };
      });
    };
}
