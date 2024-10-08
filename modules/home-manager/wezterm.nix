{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wezterm
  ];

  #xdg.configFile."./wezterm/.wezterm.lua".source = ./wezterm.lua;
  home.file."./.wezterm.lua".source = ./wezterm.lua;
	

}
