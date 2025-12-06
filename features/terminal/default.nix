# TEAM_424: Terminal feature module entry
{ config, pkgs, lib, ... }:

{
  imports = [
    ./packages.nix
    ./config.nix
  ];
}
