{ config, pkgs, ... }:

{
  imports = [
    ./home/programs/sh.nix
    ./home/programs/nvim.nix
    ./home/programs/git.nix
    ./home/programs/firefox.nix
  ];

  home.username = "ivktac";
  home.homeDirectory = "/home/ivktac";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    fira-code-nerdfont
    fzf
    bat
    du-dust
    ripgrep
    procs
    eza
    yt-dlp
    neofetch
  ];

  programs.home-manager.enable = true;
}
