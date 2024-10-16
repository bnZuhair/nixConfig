{ lib, pkgs, ... }: {
  config.plugins.conform-nvim = {
    settings = {
      formatters_by_ft = { python = [ "black" ]; };
      formatters = { black = { command = "${lib.getExe pkgs.black}"; }; };
    };
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
}
