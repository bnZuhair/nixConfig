{
	config.plugins.conform-nvim = {
		settings = {
			formatters_by_ft = {
			  python = [ "black" ];
			};
		};
	};
	config.plugins.lsp = {
		servers = {
			pyright.enable = true;
      };
   };
}
