{ inputs, config, pkgs, lib, ... }:
let
  shellAliases = with lib; with pkgs; {
    cat = "${getExe bat} --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never";
	  cp = "cp -iv";
	  du = getExe du-dust;
	  fcd = "cd $(find -type d | ${getExe fzf})";
	  g = "git";
	  ga = "git add";
	  gc = "git commit";
	  gp = "git push";
	  gs = "git status";
	  grep = getExe ripgrep;
	  la = "${getExe eza} -lah --tree";
	  ls = "${getExe eza} -h --git --icons --color=auto --group-directories-first -s extension";
	  mv = "mv -iv";
	  ps = getExe procs;
	  rebuild = "sudo nixos-rebuild switch --flake .#";
	  rm = "rm -iv";
	  tree = "${getExe eza} --tree --icons --tree";
	  untar = "tar -xvf";
	  untargz = "tar -xzf";
	  ytmp3 = ''
	    ${getExe yt-dlp} --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata --output "$(title)%s.$(ext)s"
	  '';
  };
in
{
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

  programs.bash = {
  	inherit shellAliases;
	  enable = true;
  };

  programs.fish = {
  	inherit shellAliases;
	  enable = true;
	  plugins = with pkgs; [
	    { name = "fzf-fish"; src = fishPlugins.fzf-fish.src; }
	    { name = "forgit"; src = fishPlugins.forgit; }
	  ];
  };
  
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
