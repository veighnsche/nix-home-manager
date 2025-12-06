# TEAM_424: Zoxide (smart cd) configuration module
{ config, pkgs, lib, ... }:

{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
