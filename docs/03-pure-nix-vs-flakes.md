# 3. Pure Nix vs flakes / `nix develop`

Two modes show up constantly. They are not competing languages — they are
different *jobs*.

## Pure Nix

**Meaning in this course:** write and evaluate Nix expressions for their
values — numbers, strings, functions, attrsets — with `nix eval`.

- No `flake.nix` required
- No shell, no Node/Rust install
- Used to learn syntax, test helpers, and compose config data

```bash
nix eval --file ./exercise.nix
nix eval --expr 'let f = x: x * 2; in f 21'
```

## Flakes + `nix develop`

**Meaning in this course:** a project entrypoint (`flake.nix` + `flake.lock`)
that pins inputs (usually nixpkgs) and exposes outputs such as `devShells`.

```bash
cd my-project
nix develop          # enter the project's toolchain shell
```

- Teammates get the same tool versions
- Inputs are locked in `flake.lock`
- Editors and direnv can load the env automatically (`use flake`)

## Decision guide

| Situation | Prefer |
| --- | --- |
| Learning syntax, computing a value, testing a function | Pure Nix (`nix eval`) |
| Pinning nixpkgs / sharing a reproducible toolchain | Flake + `devShells` + `nix develop` |
| One-off “give me `jq` for five minutes” (no lockfile) | Classic `nix-shell -p jq` (not this course’s default) |
| Auto-load env when you `cd` into a repo | Flake + direnv (`use flake`) |
| Packaging an app to install/run as a derivation | Flake `packages` (see next steps; not covered in depth) |

## Common confusions

1. **Flakes are not another language.** Everything inside `outputs` is still
   Nix. The flake adds structure: `inputs`, `outputs`, and a lockfile.
2. **`mkShell` is pure Nix.** A `devShell` is an attrset built with
   `pkgs.mkShell { … }`. The flake is the *project interface* around it.
3. **You use pure Nix inside every flake.** Reach for a flake when you need
   **pinned inputs, a lockfile, and a standard command** (`nix develop`).

```text
                    ┌─────────────────────────┐
                    │      flake.nix          │
                    │  inputs + lockfile      │
                    │         │               │
                    │    outputs = …          │
                    │         │               │
                    │   pure Nix: mkShell     │
                    └─────────────────────────┘
                              │
                        nix develop
```

## Classic `shell.nix` (comparison only)

Before flakes, people used `shell.nix` with `nix-shell`. That still works, but
this course standardizes on flakes so locking and sharing are consistent.
You do not need `shell.nix` for the exercises here.

## Exercise

Open [lessons/03-choose-the-tool](../lessons/03-choose-the-tool/) and answer
the scenarios. Then check [answers/03-choose-the-tool.md](../answers/03-choose-the-tool.md).

## Next

[04 — Flakes and nix develop](04-flakes-and-nix-develop.md)
