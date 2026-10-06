# 2. Nix language basics

Flakes are written in the Nix language. This lesson covers only what you need
to read a `devShell`.

## Values

```nix
42
true
"hello"
```

## Lists

```nix
[ 1 2 3 ]
[ "nodejs" "cargo" ]
```

Elements are separated by whitespace (commas are not required).

## Attribute sets (attrsets)

Attrsets are key/value maps — the heart of Nix config:

```nix
{
  name = "learn-nix";
  version = 1;
  tools = [ "nodejs" "cargo" ];
}
```

Access fields with `.`:

```nix
{ a = 1; b = 2; }.a   # → 1
```

## `let … in`

Bind names, then use them:

```nix
let
  major = 20;
  label = "node";
in
{
  message = "${label}-${toString major}";
}
```

## Functions

A function is `argument: body`:

```nix
x: x + 1
```

Destructuring an attrset is common in flakes:

```nix
{ pkgs }: pkgs.mkShell {
  packages = [ pkgs.hello ];
}
```

## String interpolation

Only inside double-quoted strings with `${…}`:

```nix
let name = "nix"; in "hello ${name}"
```

## Evaluation vs building

- **`nix eval`** computes a Nix value (number, string, attrset). No packages
  need to be installed. This is *pure Nix* practice.
- **`nix develop` / `nix build`** may download or build store paths. That comes
  in later lessons.

Try:

```bash
nix eval --expr '1 + 2'
nix eval --expr '{ a = 1; b = 2; }.a'
```

## Exercise

Open [lessons/02-attrsets-and-let](../lessons/02-attrsets-and-let/) and complete
`exercise.nix`. Check with:

```bash
cd lessons/02-attrsets-and-let
nix eval --file exercise.nix
```

You want the result to equal the attrset described in that lesson’s README.
Compare with [answers/02-attrsets-and-let.nix](../answers/02-attrsets-and-let.nix)
afterward.

## Next

[03 — Pure Nix vs flakes](03-pure-nix-vs-flakes.md)
