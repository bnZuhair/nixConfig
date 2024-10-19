{ lib, pkgs, ... }:
{
  config.plugins.conform-nvim = {
    settings = {
      formatters_by_ft = {
        html = [ "prettierd" ];
        css = [ "prettierd" ];
        javascript = [ "prettierd" ];
        javascriptreact = [ "prettierd" ];
        typescript = [ "prettierd" ];
        typescriptreact = [ "prettierd" ];
      };
      formatters = {
        prettierd = {
          command = "${lib.getExe pkgs.prettierd}";
        };
      };
    };
  };
  config.plugins.lsp = {
    servers = {
      html.enable = true;
      tailwindcss.enable = true;
      quick_lint_js.enable = true;
    };
  };
  config.plugins.emmet.enable = true;
}
