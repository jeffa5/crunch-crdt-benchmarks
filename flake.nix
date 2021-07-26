{
  description = "CRDT benchmarks";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs
            {
              system = system;
            };
        in
        {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              nodejs

              python3
              python3Packages.awesome-slugify

              rnix-lsp
              nixpkgs-fmt
            ];
          };
        });
}
