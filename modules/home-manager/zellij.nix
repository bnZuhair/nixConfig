{ config, pkgs, ... }:

{
	
    programs.zellij = {
	enable = true;
	enableZshIntegration = true;
	enableBashIntegration = true;
	settings = {
		simplified_ui = false;
		pane_frames = false;
		default_mode = "locked";
		theme = "tokyo-night";
		pane_viewport_serialization = true;
		#default_layout = "compact";
		#layout_dir ="/path/to/my/layout_dir";
		#theme_dir ="/path/to/my/layout_dir";
	};
};
}
