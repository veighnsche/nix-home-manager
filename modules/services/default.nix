# TEAM_424: Services module aggregator
# Add service modules here as they are created
{ config, pkgs, lib, ... }:

{
  imports = [
    # ./syncthing.nix
    # ./gpg-agent.nix
  ];
}
