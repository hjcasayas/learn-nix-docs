# Complete this expression.
# Use `let … in` for nodeMajor, then build the attrset described in README.md.
#
# Requirements:
#   project   = "learn-nix"
#   nodeMajor = 22          (bind this in a let)
#   label     = "node-22"   (build with string interpolation from nodeMajor)
#   tools     = [ "nodejs" "typescript" ]

let
  # TODO: bind nodeMajor
  nodeMajor = null; # replace null
in
{
  project = "learn-nix";
  inherit nodeMajor;
  # TODO: set label using "${…}" and toString
  label = "";
  # TODO: list the two tools
  tools = [ ];
}
