{ config, pkgs, ...}:

{
  programs.nixvim = {
    enable = true;
    
    colorschemes.catppuccin.enable = true;
    plugins.lightline.enable = true;
    plugins.fugitive.enable = true;
    plugins.gitsigns.enable = true;
    
    options = {
      encoding = "utf-8";
      laststatus = 3;
      
      number = true;
      relativenumber = true;
      
      colorcolumn = "80";
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      backspace = "indent,eol,start";
      
      autoread = true;
      ruler = true;
      showcmd = true;
      
      mouse = "a";
    };
    
    globals = {
      mapleader = " ";
    };
  };
}
