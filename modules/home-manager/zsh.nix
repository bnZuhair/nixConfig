{ config, pkgs, ... }:

{
  imports = [
    ./zellij.nix
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
        c = "clear";
        v = "nvim";
        t = "tmux";
        e = "exit";
        gs = "git status";
        b = "../";
        bb = "../../";
      };
    };
  };

}
