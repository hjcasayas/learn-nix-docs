# Lesson 03 — Choose the tool

For each scenario, write **pure Nix**, **flake + nix develop**, or
**classic nix-shell -p** (one-off), plus one sentence why.

Put your answers in `answers.md` in this directory (create it), or jot them
elsewhere. Then compare with
[answers/03-choose-the-tool.md](../../answers/03-choose-the-tool.md).

## Scenarios

1. You want to check that `let f = x: x * 2; in f 21` evaluates to `42`.
2. A teammate clones your Node + Rust monorepo and should get matching
   `node` / `cargo` with one command, pinned for months.
3. You need `jq` for five minutes to inspect a JSON file; you do not care
   about locking a project.
4. Your editor should load project tools automatically when you open the repo
   (via direnv).
5. You are drafting a helper that maps `{ name = "app"; }` to a string label
   and want to test it without installing packages.
