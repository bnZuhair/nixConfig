{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wezterm
  ];

  xdg.configFile.".config/wezterm/.wezterm.lua".source = ./wezterm.lua;
  #home.file."./.wezterm.lua".source = ./wezterm.lua;

}
