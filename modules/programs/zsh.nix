# TEAM_424: ZSH shell configuration module
{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };

    initExtra = ''
      # Autosuggestion color (WCAG-compliant on dark background)
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#94a3b8'

      # History behavior
      setopt HIST_IGNORE_DUPS
      setopt HIST_IGNORE_ALL_DUPS
      setopt HIST_REDUCE_BLANKS
      setopt SHARE_HISTORY
      setopt APPEND_HISTORY
    '';

    shellAliases = {
      ll = "eza -alh";
      ls = "eza";
      gs = "git status";
      cd = "z";  # zoxide
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";  # Overridden by Starship
      plugins = [
        "git"
        "sudo"
        "command-not-found"
        "colored-man-pages"
        "history"
      ];
    };
  };
}
