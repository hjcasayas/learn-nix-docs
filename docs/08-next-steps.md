# 8. Next steps

You can now:

- Evaluate pure Nix with `nix eval`
- Choose when a flake is worth it
- Enter reproducible Node and Rust shells with `nix develop`
- Optionally auto-load shells with direnv

## Where to go next

- **Package your app** — add `packages.<system>.default` with `buildNpmPackage`
  or `rustPlatform.buildRustPackage` so `nix build` produces a store result
- **Custom Rust toolchains** — [oxalica/rust-overlay](https://github.com/oxalica/rust-overlay)
  or [fenix](https://github.com/nix-community/fenix)
- **Overlays** — override or add packages on top of nixpkgs
- **NixOS** — declarative system configuration
- **home-manager** — declarative user dotfiles and user packages

## Official docs

- [Nix language tutorial](https://nix.dev/tutorials/nix-language.html)
- [Flakes](https://nix.dev/concepts/flakes.html)
- [nixpkgs manual](https://nixos.org/manual/nixpkgs/stable/)

Good luck — keep shells small, commit `flake.lock`, and grow complexity only
when a real project needs it.
