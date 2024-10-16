{
  imports = [
    #general
    ./looks.nix
    ./options.nix
    ./keymaps.nix
    ./autocommands.nix

    #plugins
    ./plugins/oil.nix
    ./plugins/lsp.nix
    ./plugins/gitsigns.nix
    ./plugins/conform.nix
    ./plugins/undotree.nix
    ./plugins/telescope.nix
    ./plugins/autopairs.nix
    ./plugins/none-ls.nix
    ./plugins/treesitter.nix
    ./plugins/nvim-cmp.nix

    #language specific
    ./languages/python.nix
    ./languages/nix.nix
  ];
}
