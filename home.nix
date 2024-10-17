{ config, pkgs, ... }:

{
  home.username = "bnzuhair";
  home.homeDirectory = "/home/bnzuhair";

  home.stateVersion = "24.05"; # don't change

  imports = [
    ./modules/home-manager/zsh.nix
    ./modules/home-manager/wezterm/wezterm.nix
  ];

  home.packages = with pkgs; [
    xclip
    ripgrep
  ];

  home.file = {
    #specify a file or write the content of a program rc or configration
  };

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
    BRWOSER = "firefox";
  };

  # configring a  program directly from here.
  programs = {
    home-manager.enable = true; # Let Home Manager install and manage itself.
  };

  xdg.enable = true;
}
