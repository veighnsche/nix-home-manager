# TEAM_424: Programs module aggregator
{ config, pkgs, lib, ... }:

{
  imports = [
    ./zsh.nix
    ./starship.nix
    ./zoxide.nix
    ./direnv.nix
    ./git.nix
  ];
}
