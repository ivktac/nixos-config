{inputs}: let
  mylib = (import ./default.nix) {inherit inputs;};
  outputs = inputs.self.outputs;

  inherit (inputs.nixpkgs.lib) nixosSystem genAttrs;
  inherit (inputs.home-manager.lib) homeManagerConfiguration;

  wm = "gnome";
in rec {
  pkgsFor = system: inputs.nixpkgs.legacyPackages.${system};

  mkSystem = config:
    nixosSystem {
      specialArgs = {inherit inputs outputs mylib;};
      modules = [
        config
        outputs.nixosModules.default
        lib.mkIf (wm == "gnome") outputs.nixosModules.gnome
      ];
    };

  mkHome = system: config:
    homeManagerConfiguration {
      pkgs = pkgsFor system;
      extraSpecialArgs = {inherit inputs mylib outputs;};
      modules = [
        config
        outputs.homeManagerModules.default
      ];
    };

  forAllSystems = pkgs:
    genAttrs [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ]
    (system: pkgs inputs.nixpkgs.legacyPackages.${system});
}
