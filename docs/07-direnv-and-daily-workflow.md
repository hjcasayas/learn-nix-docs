# 7. direnv and daily workflow

Typing `nix develop` works. For daily use, [direnv](https://direnv.net/) can
load the flake shell when you `cd` into the project.

**direnv is for the flake workflow**, not for pure `nix eval` drills.

## Setup

1. Install direnv (via your OS package manager, or temporarily with
   `nix profile install nixpkgs#direnv`).
2. Hook it into your shell (example for zsh — follow direnv’s docs for yours):

   ```bash
   eval "$(direnv hook zsh)"
   ```

3. In a flake project:

   ```bash
   echo 'use flake' > .envrc
   direnv allow
   ```

When you enter the directory, tools from `devShells.default` appear on PATH.
When you leave, they disappear.

This repo’s [lessons/07-node-rust-shell](../lessons/07-node-rust-shell/) includes
a sample `.envrc`. Run `direnv allow` there after installing direnv.

## Combined Node + Rust shell

Sometimes one repo needs both toolchains (API in Rust + frontend in Node, or
WASM tooling). One `mkShell` can list both:

```nix
packages = [
  pkgs.nodejs_22
  pkgs.rustc
  pkgs.cargo
];
```

```bash
cd lessons/07-node-rust-shell
nix develop
node --version
cargo --version
```

## Troubleshooting

| Issue | What to try |
| --- | --- |
| `experimental CLI flags` / flakes disabled | Add `experimental-features = nix-command flakes` to `~/.config/nix/nix.conf` |
| Wrong CPU / empty shell | Ensure your system is in the flake’s `forAllSystems` list (`uname -m` → `arm64` is `aarch64-*`) |
| Stale env after editing `flake.nix` | `direnv reload` or exit and `nix develop` again |
| Disk use grows over time | Occasional `nix store gc` (optional; frees unused store paths) |

## Next

[08 — Next steps](08-next-steps.md)
