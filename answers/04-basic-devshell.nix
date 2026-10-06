# Solved packages list for lessons/04-basic-devshell/flake.nix
#
# packages = [
#   pkgs.hello
#   pkgs.jq
#   pkgs.curl
# ];

{
  description = "Lesson 04 answer: basic mkShell with jq and curl";

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
            packages = [
              pkgs.hello
              pkgs.jq
              pkgs.curl
            ];
            shellHook = ''
              echo "Lesson 04 (answer): hello, jq, curl"
            '';
          };
        }
      );
    };
}
