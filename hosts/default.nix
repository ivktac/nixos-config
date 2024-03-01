{
  homeImports,
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;

  modules = "${self}/modules/system";
  profiles = "${self}/hosts/profiles";

  specialArgs = {inherit inputs self;};
in {
  flake.nixosConfigurations = {
    nixos = nixosSystem {
      inherit specialArgs; 

      modules = [
        ./nixos
        
        "${modules}/config"
        "${modules}/programs"
        "${modules}/services"
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
