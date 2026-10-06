# Answers — Lesson 03

1. **Pure Nix** (`nix eval --expr '…'`). You only need a value; no project toolchain.

2. **Flake + `nix develop`**. Shared, locked tool versions for a real repo.

3. **Classic `nix-shell -p jq`**. Short-lived, no need for a flake or lockfile.

4. **Flake + direnv** (`use flake`). direnv loads the flake `devShell` on `cd`.

5. **Pure Nix**. Testing a small function/attrset transform; `nix eval` is enough.
