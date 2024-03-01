{
	description = "My NixOS Configuration!";

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} {imports = [./flake];};

	inputs = {
   	nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/nur";
    flake-utils.url = "github:numtide/flake-utils";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		nh = {
		  url = "github:viperML/nh";
		  inputs.nixpkgs.follows = "nixpkgs";
		};

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
		
		nixvim = {
		  url = "github:nix-community/nixvim";
		  inputs.nixpkgs.follows = "nixpkgs";
		};

  	flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};
}
