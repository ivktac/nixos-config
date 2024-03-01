{ config, pkgs, ... }:

{
  imports = [./sh.nix];

  home.username = "ivktac";
  home.homeDirectory = "/home/ivktac";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    fzf
    bat
    du-dust
    ripgrep
    procs
    eza
    yt-dlp
  ];

  home.sessionVariables = {};

  programs.firefox.enable = true;
  
  programs.git = {
    enable = true;
    lfs.enable = true;
    delta.enable = true;
    
    userName = "ivktac";
    userEmail = "git@tkachuk.email";
    signing = {
      key = "B3694380B336C5A4";
      signByDefault = true;
    };
    
    extraConfig = {
      init.defaultBranch = "main";
      branch.autosetupmerge = "true";
      push.default = "current";
      merge.stat = "true";
      core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      repack.usedeltabaseoffset = "true";
      pull.ff = "only";
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
    };
  };
  
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
  

  programs.home-manager.enable = true;
}
