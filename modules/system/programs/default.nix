{
  imports = [
    ./bash.nix
    ./home-manager.nix
    ./fish.nix
  ];

  programs.dconf.enable = true;
}
