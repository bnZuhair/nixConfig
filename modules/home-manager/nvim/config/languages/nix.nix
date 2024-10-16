{
	config.plugins.conform-nvim = {
		settings = {
			formatters_by_ft = {
			  nix = [ "nixfmt" ];
			};
		};
	};
	config.plugins.none-ls.sources.formatting.nixfmt.enable = true;
}
