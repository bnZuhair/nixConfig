{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wezterm
  ];

  #home.file.".config/wezterm/.wezterm.lua".source = ./wezterm.lua;
  home.file."./.wezterm.lua".source = ./wezterm.lua;

}
