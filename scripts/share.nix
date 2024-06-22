{ pkgs }:

pkgs.writeShellScriptBin "share" ''
  ${pkgs.curl}/bin/curl -F"file=@$1" https://0x0.st
''
