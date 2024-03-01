{ config, pkgs, ... }:

{
  imports = [
    ./home/programs/utils.nix
    ./home/programs/sh.nix
    ./home/programs/nvim.nix
    ./home/programs/git.nix
    ./home/programs/firefox.nix
    ./home/programs/starship.nix
  ];

  home.username = "ivktac";
  home.homeDirectory = "/home/ivktac";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    fira-code-nerdfont
    du-dust
    ripgrep
    procs
    yt-dlp
    telegram-desktop
  ];

  programs.home-manager.enable = true;
}
