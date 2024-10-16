{
  config.plugins.conform-nvim = {
    settings = { formatters_by_ft = { python = [ "black" ]; }; };
  };
  #config.plugins.lsp = {
  #	servers.pyright = {
  #		enable = true;
  #		settings.plugins.black.enabled = true;
  #   };
  #};
  config.plugins.lsp = {
    servers.pylsp = {
      enable = true;
      settings.plugins.black.enabled = true;
    };
  };
  config.plugins.none-ls.sources.formatting.black.enable = true;
}
