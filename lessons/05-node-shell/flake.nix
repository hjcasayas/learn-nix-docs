{
  description = "Lesson 05: Node development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "x86_64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            # TODO (exercise): add pkgs.typescript
            packages = [
              pkgs.nodejs_22
            ];
            shellHook = ''
              echo "Node $(node --version) / npm $(npm --version)"
            '';
          };
        }
      );
    };
}
