{
	config.keymaps = [
		{
			mode = "n";
			action = "<cmd>nohlsearch<CR>";
      	key = "<Esc>";
			options = {
      	  desc = "to Open Oil.nvim ";
      	};
	    }
	{
		mode = "n";
      action = "o<Esc>k";
      key = "<leader>o";
		options = {
        desc = "make a new line down from normal mode and still be in it";
      };
    }
	{
		mode = "n";
      action = "O<Esc>j";
      key = "<leader>O";
		options = {
        desc = "a new line up from normal mode and still be in it";
      };
    }

  ];

}
