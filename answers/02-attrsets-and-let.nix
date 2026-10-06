let
  nodeMajor = 22;
in
{
  project = "learn-nix";
  inherit nodeMajor;
  label = "node-${toString nodeMajor}";
  tools = [
    "nodejs"
    "typescript"
  ];
}
