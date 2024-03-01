{
	description = "My NixOS Configuration!";

	outputs = inputs @ { self, nixpkgs, home-manager, nixvim, ... }: 
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [./configuration.nix];
			};
		};

		homeConfigurations = {
			ivktac = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
				  ./home.nix
				  nixvim.homeManagerModules.nixvim
				];
			};
		};
	};

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		
		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		nixvim = {
		  url = "github:nix-community/nixvim";
		  inputs.nixpkgs.follows = "nixpkgs";
		};
	};
}
