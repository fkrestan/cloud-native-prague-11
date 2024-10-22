{
  description = "Flake shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          gnumake
          go
          jsonnet
          jsonnet-bundler
          k3d
          kubectl
          kubernetes-helm
          skopeo
          tanka
        ];
      };
    };
}
