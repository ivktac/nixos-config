{inputs, ...}: {
  imports = [
    inputs.nh.nixosModules.default
  ];
  
  environment.variables.FLAKE = "/home/ivktac/.dotfiles";
  
  nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
