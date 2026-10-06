# Lesson 04 — Basic devShell

This flake starts with only `hello`. Add **`jq`** and **`curl`** to
`packages` in `flake.nix`, then:

```bash
nix develop
jq --version
curl --version
exit
```

Spoilers: [answers/04-basic-devshell.nix](../../answers/04-basic-devshell.nix)
(the `devShells` fragment only — merge into this flake).
