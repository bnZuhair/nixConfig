{ config, pkgs, ... }:

{
  imports = [
    ./shell_tools.nix
  ];
  programs = {
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
        v = "nvim";
        t = "tmux";
      };
      zsh-abbr = {
        enable = true;
        abbreviations = {
          c = "clear";
          gs = "git status";
          ga = "git add";
          gc = "git commit";
          gco = "git checkout";
          e = "exit";
          b = "../";
          bb = "../../";
        };
      };
    };
  };

}
