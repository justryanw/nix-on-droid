{ config, lib, pkgs, ... }:

{
  # Read the changelog before changing this value
  home.stateVersion = "23.11";

  # insert home-manager config
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        s = "nix-on-droid switch --flake ~/flake";
      };
    };

    starship.enable = true;

    git = {
      enable = true;
      userName = "Ryan Walker";
      userEmail = "ryanjwalker2001@gmail.com";
      aliases = {
        acm = "!git add -A && git commit -m";
      };	
    };
  };
}
