{ config, pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      preferAbbrs = true;
      shellAbbrs = {
        gs = "git status";
        ga = "git add";
        gc = "git commit";
      };
    };
  };
}
