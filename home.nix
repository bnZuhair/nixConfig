{ config, pkgs, ... }:

{
  home.username = "bnzuhair";
  home.homeDirectory = "/home/bnzuhair";

  home.stateVersion = "24.05"; # don't change 

  home.packages = [
    # font
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.wezterm

  ];

  home.file = {
	#specify a file or write the content of a program rc or configration
	
	
  };

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
    BRWOSER = "firefox";
  };
  
  # configring a  program directly from here.
  programs = {
   git = {
	enable = true;
	userName = "bnzuhair";
	userEmail = "relsalehzohair@gamil.com";
};
# shell
  # zsh
   zsh = {
     enable = true;
     autocd = true;
     dotDir = ".config/zsh";
     history.path = ".config/zsh/.zsh_history";
     history.ignoreSpace = false;
     autosuggestion.enable = true;
     syntaxHighlighting.enable = true;
     syntaxHighlighting.highlighters = [ "main" "brackets" "root" ];
     historySubstringSearch.enable = true;
     prezto = {
        enable = false;
        editor.keymap = "vi";
        caseSensitive = false;
     };
     shellAliases = {
         ll = "ls -l";
         c = "clear";
	 v = "nvim";
	 t = "tmux";
	 e = "exit";
    };
   };
   # starship
   starship = {
	enable = true;
	enableZshIntegration = true;
	enableBashIntegration = true;
 	settings = 
	  {
	    add_newline = false;
	    character = {
	  	success_symbol = "[❯](green)";
	  	error_symbol = "[❯](red)";
	  	vicmd_symbol = "[❮](green)";
	    };
	  };
   };

   fzf = {
	enable = true;
	enableZshIntegration = true;
	enableBashIntegration = true;
	#tmux.enableShellIntegration = true;
	#tmux.shellIntegrationOptions = [];
};
#   tmux = {
#	enable = true;
#	keyMode = "vi";
#	mouse = true;
#	prefix = "M-Space"
#
#};
    zellij = {
	enable = true;
	enableZshIntegration = true;
	enableBashIntegration = true;
	settings = {
		simplified_ui = true;
		pane_frames = false;
		theme = "Catppuccin Macchiato";
#expermental
		pane_viewport_serialization = true;
#later
		#default_layout = "compact";
		#layout_dir ="/path/to/my/layout_dir";
		#theme_dir ="/path/to/my/layout_dir";
	};
};
  
   home-manager.enable = true;# Let Home Manager install and manage itself.
 };

}


