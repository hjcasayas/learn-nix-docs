# Learn Nix for Development Environments

A short guided course: just enough Nix language and flakes to set up
reproducible **Node** and **Rust** development shells.

## Prerequisites

1. Install Nix (either works):
   - [Determinate Nix installer](https://docs.determinate.systems/determinate-nix)
   - [Official Nix installer](https://nixos.org/download/)
2. Enable flakes (Determinate enables them by default). With the official
   installer, add to `~/.config/nix/nix.conf`:

   ```
   experimental-features = nix-command flakes
   ```

3. Confirm:

   ```bash
   nix --version
   nix flake --help
   ```

## How to work through the course

1. Read the doc in `docs/` for the lesson number.
2. Do the exercise in the matching `lessons/` directory.
3. Check yourself against `answers/` only after trying.

**Suggested pace:** one lesson per sitting.

### Pure Nix vs flakes

| Lessons | Mode | Typical command |
| --- | --- | --- |
| 02–03 | Pure Nix (language & decisions) | `nix eval` |
| 01, 04–07 | Flakes / project shells | `nix develop` |

You still write Nix *language* inside every flake. Flakes add pinned inputs,
a lockfile, and a standard project interface.

## Lesson map

| # | Doc | Lesson |
| --- | --- | --- |
| 1 | [Why Nix for dev envs](docs/01-why-nix-dev-envs.md) | — |
| 2 | [Nix language basics](docs/02-nix-language-basics.md) | [02-attrsets-and-let](lessons/02-attrsets-and-let/) |
| 3 | [Pure Nix vs flakes](docs/03-pure-nix-vs-flakes.md) | [03-choose-the-tool](lessons/03-choose-the-tool/) |
| 4 | [Flakes and nix develop](docs/04-flakes-and-nix-develop.md) | [01-hello-flake](lessons/01-hello-flake/), [04-basic-devshell](lessons/04-basic-devshell/) |
| 5 | [Node dev shell](docs/05-node-dev-shell.md) | [05-node-shell](lessons/05-node-shell/) |
| 6 | [Rust dev shell](docs/06-rust-dev-shell.md) | [06-rust-shell](lessons/06-rust-shell/) |
| 7 | [direnv & daily workflow](docs/07-direnv-and-daily-workflow.md) | [07-node-rust-shell](lessons/07-node-rust-shell/) |
| 8 | [Next steps](docs/08-next-steps.md) | — |

## Out of scope

This course stops at **dev shells**. It does not cover NixOS system config,
home-manager, or publishing packages to a binary cache.
