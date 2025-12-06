# TEAM_424: Desktop module aggregator
# Add desktop-related modules here (themes, fonts, etc.)
{ config, pkgs, lib, ... }:

{
  imports = [
    ./konsole.nix
    # ./gtk.nix
    # ./qt.nix
    # ./fonts.nix
  ];
}
