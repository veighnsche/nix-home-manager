# Home-manager config for Fedora KDE (standalone, not NixOS)
{ config, pkgs, lib, configDir, ... }:

{
  # ============================================
  # User Identity
  # ============================================
  home.username = "vince";
  home.homeDirectory = "/home/vince";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  # ============================================
  # Packages
  # ============================================
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

    # Dev tools
    nodejs_24
    uv            # fast Python package manager (includes uvx)
  ];

  # ============================================
  # WINDSURF
  # ============================================
  # TEAM_425: Direct symlink to repo file - edits reflect immediately without rebuild
  home.file.".codeium/windsurf/mcp_config.json".source = 
    config.lib.file.mkOutOfStoreSymlink "${configDir}/dotfiles/windsurf/mcp_config.json";

  home.file.".codeium/windsurf/global_rules.md".source = 
    config.lib.file.mkOutOfStoreSymlink "${configDir}/dotfiles/windsurf/memories/global_rules.md";

  home.file.".codeium/windsurf/workflows".source = 
    config.lib.file.mkOutOfStoreSymlink "${configDir}/dotfiles/windsurf/global_workflows";

  # ============================================
  # ZSH
  # ============================================
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };

    initContent = ''
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
      # cd = "z";  # zoxide
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

  # ============================================
  # Starship Prompt
  # ============================================
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

  # ============================================
  # Zoxide (smart cd)
  # ============================================
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # ============================================
  # Direnv
  # ============================================
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # ============================================
  # Git
  # ============================================
  programs.git = {
    enable = true;
    settings.user = {
      name = "Vince Liem";
      email = "vincepaul.liem@gmail.com";
    };
  };

  # ============================================
  # Konsole
  # ============================================
  programs.konsole = {
    enable = true;
    defaultProfile = "Vince";
    profiles = {
      "Vince" = {
        command = "${pkgs.zsh}/bin/zsh";
        font = {
          name = "Hack";
          size = 11;
        };
      };
    };
  };
}
