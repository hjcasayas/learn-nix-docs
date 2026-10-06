# Lesson 07 — Node + Rust shell

One `devShell` with both toolchains — useful for an API in Rust plus a Node
frontend, or WASM tooling.

```bash
nix develop
node --version
cargo --version
npm test
cargo test
```

Optional direnv: if you use direnv, run `direnv allow` in this directory so
`.envrc` (`use flake`) loads the shell on `cd`.
