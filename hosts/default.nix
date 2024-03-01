{
  homeImports,
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs) nur;

  profiles = "${self}/hosts/profiles";

  specialArgs = {inherit inputs self;};
in {
  flake.nixosConfigurations = {
    nixos = nixosSystem {
      inherit specialArgs; 

      modules = [
        ./nixos

        { nixpkgs.overlays = [ nur.overlay ]; }

        "${profiles}/gnome.nix"
        
        {
          home-manager = {
            users.ivktac.imports = homeImports.ivktac;
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
