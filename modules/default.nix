# TEAM_424: Top-level modules aggregator
{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs
    ./services
    ./desktop
  ];
}
