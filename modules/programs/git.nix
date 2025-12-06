# TEAM_425: Git configuration for user identity
{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Vince Liem";
        email = "vincepaul.liem@gmail.com";
      };
    };
  };
}
