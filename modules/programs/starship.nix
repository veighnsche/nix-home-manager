# TEAM_424: Starship prompt configuration module
{ config, pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      palette = "vince";
      palettes = {
        vince = {
          bg = "#1a1a1a";
          fg = "#e0e0e0";
          accent = "#7aa2f7";
          error = "#f7768e";
          subtle = "#565f89";
        };
      };
      format = "$hostname$all";
      hostname = {
        ssh_only = true;
        format = "[$hostname](fg:accent) ";
      };
      character = {
        success_symbol = "[❯](fg:accent)";
        error_symbol = "[❯](fg:error)";
      };
      battery.disabled = true;
    };
  };
}
