{
  config.colorschemes.tokyonight.enable = true;
  config.plugins = {
    lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = true;
          disabled_filetypes = {
            statusline = [
              "dashboard"
              "alpha"
              "starter"
            ];
          };
        };
        inactive_sections = {
          lualine_x = [
            "filename"
            "filetype"
          ];
        };
        sections = {
          lualine_a = [
            {
              __unkeyed = "mode";
              fmt = "string.lower";
              separator.left = "";
              separator.right = "";
            }
          ];
          lualine_b = [
            {
              __unkeyed = "branch";
              icon.__unkeyed = "";
              separator.left = "";
              separator.right = "";
            }
            {
              __unkeyed = "diff";
              separator.left = "";
              separator.right = "";
            }
          ];
          lualine_c = [
            {
              __unkeyed = "diagnostic";
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = "󰝶 ";
              };
              separator.left = "";
              separator.right = "";
            }
          ];
          lualine_x = [ "" ];
          lualine_y = [
            {
              __unkeyed = "filetype";
              icon_only = true;
              separator.left = "";
              separator.right = "";
            }
            {
              __unkeyed = "filename";
              symbols = {
                modified = "";
                readonly = "👁️";
                unnamed = "";
              };
              separator.left = "";
              separator.right = "";
            }
          ];
          lualine_z = [
            {
              __unkeyed = "location";
              separator.left = "";
              separator.right = "";
            }
          ];
        };
      };
    };
    web-devicons.enable = true;
    indent-blankline = {
      enable = true;
      settings.indent.char = "│";
    };
  };
}
