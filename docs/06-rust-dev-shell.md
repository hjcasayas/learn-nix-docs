# 6. Rust development shell

Same idea as Node: Nix puts `rustc` and `cargo` on your PATH; you still use
Cargo for crate dependencies.

## Pattern

```nix
pkgs.mkShell {
  packages = [
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
  ];
  shellHook = ''
    echo "rustc $(rustc --version)"
  '';
}
```

This uses the Rust toolchain from nixpkgs. For bleeding-edge or custom
toolchains, people later reach for overlays such as
[rust-overlay](https://github.com/oxalica/rust-overlay) or fenix — see
[08 — Next steps](08-next-steps.md). You do not need those yet.

## Try the lesson

```bash
cd lessons/06-rust-shell
nix develop
cargo test
```

## Exercise

Add `pkgs.clippy` to `packages`, re-enter the shell, and run:

```bash
cargo clippy
```

Compare with [answers/06-rust-shell/flake.nix](../answers/06-rust-shell/flake.nix).

## Next

[07 — direnv and daily workflow](07-direnv-and-daily-workflow.md)
