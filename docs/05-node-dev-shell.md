# 5. Node development shell

Nix provides the **toolchain** (Node, npm). Your app still uses `package.json`
and a local `node_modules/` the usual way. Nix does not replace npm.

## Pattern

```nix
pkgs.mkShell {
  packages = [
    pkgs.nodejs_22
  ];
  shellHook = ''
    echo "Node $(node --version) / npm $(npm --version)"
  '';
}
```

Pin a major via the nixpkgs attribute (`nodejs_20`, `nodejs_22`, …) so the
whole team shares that major. The exact patch comes from the locked nixpkgs.

## Try the lesson

```bash
cd lessons/05-node-shell
nix develop
npm install
npm test
```

## What Nix does *not* replace

| Handled by Nix | Handled by npm |
| --- | --- |
| `node`, `npm` binaries | Dependencies in `package.json` |
| Optional global CLIs (e.g. `typescript` from nixpkgs) | Project `node_modules` |

## Exercise

Add `pkgs.typescript` to the shell’s `packages`, re-enter with `nix develop`,
and run:

```bash
tsc --version
```

Compare with [answers/05-node-shell/flake.nix](../answers/05-node-shell/flake.nix).

## Next

[06 — Rust development shell](06-rust-dev-shell.md)
