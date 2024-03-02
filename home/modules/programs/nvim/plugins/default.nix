{
  imports = [
    ./treesitter.nix
    ./telescope.nix
    ./fugitive.nix
  ];

  programs.nixvim = {
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.transparentBackground = true;

    plugins.neo-tree.enable = true;

    plugins.lualine = {
      enable = true;
    };

    plugins.gitsigns.enable = true;
  };
}
