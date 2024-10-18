{ config, pkgs, ... }:
{
  config.home.packages = with pkgs; [
    zellij
  ];
  config.xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  #xdg.configFile."zellij/layouts/default.kdl".source = ./layouts.kdl;

  #to make zsh auto run zellij and make alaises work
  config.programs.zsh = {
    initExtra = ''
      ${builtins.readFile ./zshIntegrasion}
    '';
  };
}
