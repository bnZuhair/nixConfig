{
  config.plugins.oil = {
		enable = true;
		settings = {
			default_file_explorer = true;
			constrain_cursor = "editable";
			useDefaultKeymaps = true;
			delete_to_trash = true;
			skip_confirm_for_simple_edits = true;
			view_options = {
				show_hidden = true;
			};
      };
  };
  config.keymaps = [
	{
		mode = "n";
      action = "<cmd>Oil<CR>";
      key = "-";
		options = {
        desc = "to Open Oil.nvim ";
      };
    }

  ];

}
