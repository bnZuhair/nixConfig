{ config, pkgs, ... }:
{
	config.home.packages = with pkgs; [
		#python
		black

		#nix
	];
}

