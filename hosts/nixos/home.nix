{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    outputs.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    du-dust
    fd
    procs
    ripgrep
    yt-dlp
  ];

  home = {
    username = "ivktac";
    homeDirectory = "/home/ivktac";
  };

  programs.home-manager.enable = true;
}
