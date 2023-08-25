{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in
        with pkgs; {
          devShells.default = mkShell {
            buildInputs = [ gnumake xorg.libX11.dev xorg.libXft xorg.libXinerama ];
          };
        }
      );
}
