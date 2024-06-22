{ pkgs }:

pkgs.writeShellScriptBin "share" ''
  echo "hello"
''
