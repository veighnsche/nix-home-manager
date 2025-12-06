# TEAM_424: Terminal feature packages
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Better CLI tools
    bat           # cat with syntax highlighting
    eza           # ls replacement
    ripgrep       # fast grep
    fd            # find replacement

    # Remote access
    mosh

    # Network tools
    prettyping
    httpie

    # System monitoring
    htop
    btop
    fastfetch

    # Editors
    helix
    neovim
  ];
}
