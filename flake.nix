{
	description = "My NixOS Configuration!";

	outputs = inputs @ { self, nixpkgs, home-manager, nixvim, nur, ... }: 
		let
			lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [
          { nixpkgs.overlays = [ nur.overlay ]; }
          ./configuration.nix
        ];
			};
		};

		homeConfigurations = {
			ivktac = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
		  	modules = [
          { nixpkgs.overlays = [ nur.overlay ]; }
				  ./home.nix
				  nixvim.homeManagerModules.nixvim
				];
			};
		};
	};

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/nur";
		
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
