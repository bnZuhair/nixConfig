{
  config.plugins.cmp = {
    enable = true;

    settings = {
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';

      completion = { completeopt = "menu,menuone,noinsert"; };

      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-y>" = "cmp.mapping.confirm { select = true }";

        "<C-Space>" = "cmp.mapping.complete {}";

        "<C-l>" = ''
          cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' })
        '';
        "<C-h>" = ''
          cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' })
        '';
      };

      sources = [
        { name = "buffer"; }
        { name = "luasnip"; }
        { name = "nvim_lsp"; }
        { name = "path"; }
      ];
    };
  };
  config.plugins = {
    cmp-nvim-lsp = { enable = true; }; # lsp
    cmp-buffer = { enable = true; };
    cmp-path = { enable = true; }; # file system paths
    cmp_luasnip = { enable = true; }; # snippets
    cmp-cmdline = { enable = false; };
  };
}
