# TEAM_424: Home-manager config for Fedora KDE
# Modular structure - imports, identity, and feature switches only
{ config, pkgs, lib, ... }:

{
  # ============================================
  # Module Imports
  # ============================================
  imports = [
    ./modules
    ./features
  ];

  # ============================================
  # User Identity
  # ============================================
  home.username = "vince";
  home.homeDirectory = "/home/vince";
  home.stateVersion = "24.05";

  # ============================================
  # Global Defaults
  # ============================================
  programs.home-manager.enable = true;

  # ============================================
  # Feature Switches
  # ============================================
  # Features are enabled by importing them in ./features/default.nix
  # Add custom enable/disable options here as the config grows
}
