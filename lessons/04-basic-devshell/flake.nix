{
  description = "Lesson 04: basic mkShell — add jq and curl";

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
            # TODO: add pkgs.jq and pkgs.curl
            packages = [ pkgs.hello ];
            shellHook = ''
              echo "Lesson 04: add jq and curl to packages, then re-enter."
            '';
          };
        }
      );
    };
}
