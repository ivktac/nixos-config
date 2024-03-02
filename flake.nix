{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/nur";
    catppuccin-vsc.url = "github:catppuccin/vscode";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nur,
    ...
  }: let
    mylib = import ./lib {inherit inputs;};

    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in
    with mylib; {
      nixosConfigurations = {
        nixos = mkSystem ./hosts/nixos/configuration.nix;
      };

      homeConfigurations = {
        "ivktac@nixos" = mkHome "x86_64-linux" ./hosts/nixos/home.nix;
      };

      homeManagerModules.default = ./modules/home-manager;
      nixosModules.default = ./modules/nixos;

      packages.x86_64-linux = {
        firefox-gnome-theme = pkgs.callPackage ./pkgs/firefox-gnome-theme {};
      };

      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [
          alejandra
          deadnix
          git
          nil
        ];
        name = "dots";
      };

      formatter = pkgs.alejandra;
    };
}
