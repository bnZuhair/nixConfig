{ lib, pkgs, ... }: {
  config.plugins.conform-nvim = {
    settings = {
      formatters_by_ft = { nix = [ "nixfmt" ]; };
      formatters = {
        nixfmt = { command = "${lib.getExe pkgs.nixfmt-rfc-style}"; };
      };
    };
  };
}
