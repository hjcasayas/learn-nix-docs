# 1. Why Nix for development environments

## The problem

On a typical project, each person installs Node, Rust, or CLI tools differently:

- Different majors (Node 18 vs 22)
- Tools on the PATH from Homebrew, nvm, rustup, or “I thought I installed that”
- New teammates spend a day matching versions instead of shipping code

The result is the familiar “works on my machine.”

## The Nix mental model

You declare the tools you need. Nix builds (or downloads) those exact packages
into an isolated environment and puts them on your PATH for that shell session.

```text
flake.nix  →  pinned nixpkgs  →  mkShell { packages = [ nodejs cargo ]; }
                                      ↓
                               nix develop
                                      ↓
                         same toolchain for everyone
```

You are not installing tools globally into the OS. You are entering a
**project shell** that provides them.

## What this course covers

- Enough Nix **language** to read and write small expressions
- When to use **pure evaluation** (`nix eval`) vs **flakes** (`nix develop`)
- Practical **Node** and **Rust** `devShell`s
- Optional **direnv** so the shell loads when you `cd` into a project

## What it does not cover

- Full Nix language theory
- NixOS or home-manager
- Building and shipping production packages

## Next

Continue to [02 — Nix language basics](02-nix-language-basics.md).
