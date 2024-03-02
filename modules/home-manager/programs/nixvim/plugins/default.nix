{
  imports = [
    ./alpha.nix
    ./appearance.nix
    ./completion.nix
    ./git.nix
    ./icons.nix
    ./lsp.nix
    ./lsp.nix
    ./neotree.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.transparentBackground = true;
  };
}
