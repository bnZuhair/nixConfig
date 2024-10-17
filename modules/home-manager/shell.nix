{ config, pkgs, ... }:

{
  imports = [
    ./zellij.nix
    ./git.nix
  ];
  programs = {
    # shell
    # zsh
    zsh = {
      enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      history.path = "$HOME/.config/zsh/.zsh_history";
      history.ignoreSpace = false;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = [
        "main"
        "brackets"
        "root"
      ];
      historySubstringSearch.enable = true;
      prezto = {
        enable = false;
        editor.keymap = "vi";
        caseSensitive = false;
      };
      shellAliases = {
        ll = "ls -l";
        c = "clear";
        v = "nvim";
        t = "tmux";
        e = "exit";
        gs = "git status";
        b = "../";
        bb = "../../";
      };
    };
    # starship
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[❯](green)";
          error_symbol = "[❯](red)";
          vicmd_symbol = "[❮](green)";
        };
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      #tmux.enableShellIntegration = true;
      #tmux.shellIntegrationOptions = [];
    };
    #   tmux = {
    #	enable = true;
    #	keyMode = "vi";
    #	mouse = true;
    #	prefix = "M-Space"
    #
    #};
  };

}
