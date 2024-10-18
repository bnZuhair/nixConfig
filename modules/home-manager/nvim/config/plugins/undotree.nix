{
  config.plugins.undotree = {
    enable = true;
  };
  config.keymaps = [
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>";
      options.desc = "Toggle Undotree";
    }
  ];
}
