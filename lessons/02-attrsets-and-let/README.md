# Lesson 02 — Attrsets and `let`

Edit `exercise.nix` so that evaluating it produces **exactly**:

```nix
{
  project = "learn-nix";
  nodeMajor = 22;
  label = "node-22";
  tools = [ "nodejs" "typescript" ];
}
```

Hints are in the file as comments. Check:

```bash
nix eval --file exercise.nix
```

Expected output (formatting may vary):

```text
{ label = "node-22"; nodeMajor = 22; project = "learn-nix"; tools = [ "nodejs" "typescript" ]; }
```

Spoilers: [answers/02-attrsets-and-let.nix](../../answers/02-attrsets-and-let.nix)
