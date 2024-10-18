{ config, pkgs, ... }:

{
  imports = [
    ./shell_tools.nix
  ];
  config.programs = {
    # zsh
    zsh = {
      enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      history.path = "$HOME/.config/zsh/.zsh_history";
      history.ignoreSpace = false;
      zplug = {
        enable = true;
        zplugHome = "${config.home.homeDirectory}/.config/zsh/.zplug";
        plugins = [
          { name = "zsh-users/zsh-completions"; }
          {
            name = "zsh-users/zsh-history-substring-search";
            tags = [ "as:plugin" ];
          }
          {
            name = "lib/completion";
            tags = [ "from:oh-my-zsh" ];
          }
          { name = "zsh-users/zsh-autosuggestions"; }
          { name = "jeffreytse/zsh-vi-mode"; }
          {
            name = "zsh-users/zsh-syntax-highlighting";
            tags = [ "defer:2" ];
          }
        ];
      };
      completionInit = ''
        autoload -U compinit && compinit
      '';
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
      initExtra = ''
        bindkey '^[[A' history-substring-search-up
        bindkey '^[[B' history-substring-search-down
        bindkey '^[[1;5C' forward-word
      '';
    };
  };
}
