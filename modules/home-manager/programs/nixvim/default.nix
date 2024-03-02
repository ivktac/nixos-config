{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
    ./keymaps.nix
  ];

  programs.nixvim.enable = true;

  home.sessionVariables.EDITOR = "nvim";
  home.shellAliases.vimdiff = "nvim -d";
}