{
  programs.nixvim = {
    enable = true;
  };

  home.sessionVariables.EDITOR = "nvim";
  home.shellAliases.vimdiff = "nvim -d";
}
