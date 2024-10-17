{ config, pkgs, ... }:
{
  imports = [ ./zellij/zellij.nix ];
  programs = {
    git = {
      enable = true;
      userName = "bnzuhair";
      userEmail = "relsalehzohair@gamil.com";
    };
    starship = {
      enable = true;
      settings = {
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
    };
  };
}
