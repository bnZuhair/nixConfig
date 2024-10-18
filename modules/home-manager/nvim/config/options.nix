{ lib, pkgs, ... }:

{
  config.globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };
  config.opts = {
    number = true;
    relativenumber = true;

    mouse = "a";

    showmode = false;

    breakindent = true;

    undofile = true;

    ignorecase = true;
    smartcase = true;
    signcolumn = "yes";

    updatetime = 250;
    timeoutlen = 300;

    splitright = true;
    splitbelow = true;

    list = true;
    listchars.nbsp = "␣";

    expandtab = true;
    tabstop = 3;
    shiftwidth = 3;
    softtabstop = 3;
  };
}
