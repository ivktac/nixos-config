{ inputs, lib, ... }:
let
  sharedModules = [
    ./modules/programs/git.nix
    ./modules/programs/gpg.nix
    ./modules/programs/ssh.nix
    ./modules/programs/utils.nix
    ./modules/programs/sh.nix
#    ./modules/programs/nvim.nix
    ./modules/programs/starship.nix
  ];

  homeImports = {
    ivktac = [
      ./home.nix
      ./profiles/gnome.nix
    ]
    ++ lib.concatLists [sharedModules];
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
  
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      ivktac = homeManagerConfiguration {
        inherit pkgs;
        modules = homeImports.ivtkac;
      };
    };
  };
}
