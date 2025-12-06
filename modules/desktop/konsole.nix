# TEAM_424: Konsole terminal emulator configuration
{ config, pkgs, lib, ... }:

{
  programs.konsole = {
    enable = true;

    defaultProfile = "Vince";

    profiles = {
      "Vince" = {
        # Use the Nix-managed zsh
        command = "${pkgs.zsh}/bin/zsh";
        font = {
          name = "Hack";
          size = 11;
        };
        # colorScheme = "Breeze";  # Or your preferred scheme
      };
    };
  };
}
