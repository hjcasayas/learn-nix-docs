# 4. Flakes and `nix develop`

## Anatomy of a flake

A minimal flake looks like this:

```nix
{
  description = "my project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "aarch64-darwin"; # or x86_64-linux, etc.
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.hello ];
      };
    };
}
```

| Piece | Role |
| --- | --- |
| `inputs` | Where dependencies come from (usually nixpkgs) |
| `flake.lock` | Exact revisions of those inputs (commit this file) |
| `outputs` | What the flake provides (`devShells`, later `packages`, …) |
| `devShells.<system>.default` | Shell entered by `nix develop` |

Everything under `outputs` is still pure Nix evaluation — the flake only
organizes inputs and names the results.

## Multi-system pattern

Hard-coding one `system` is awkward on teams. Lessons in this repo use a small
helper so the same flake works on macOS and Linux:

```nix
outputs = { nixpkgs, ... }:
  let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
      "x86_64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
  in
  {
    devShells = forAllSystems (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        default = pkgs.mkShell {
          packages = [ pkgs.hello ];
        };
      });
  };
```

## Commands

```bash
cd lessons/01-hello-flake
nix develop          # enter the shell (creates flake.lock on first run)
hello                # provided by the shell
exit                 # leave

nix flake metadata   # show locked inputs
nix flake check      # light validation (optional)
```

Commit `flake.lock` so everyone resolves the same nixpkgs revision.

## Exercises

1. Enter [lessons/01-hello-flake](../lessons/01-hello-flake/) with `nix develop`
   and run `hello`.
2. Open [lessons/04-basic-devshell](../lessons/04-basic-devshell/). Add `jq`
   and `curl` to `packages`, enter the shell, and verify both commands exist.
   See [answers/04-basic-devshell.nix](../answers/04-basic-devshell.nix) if stuck.

## Next

[05 — Node development shell](05-node-dev-shell.md)
