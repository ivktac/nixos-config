{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = ["nix"];
      };
      treesitter-context.enable = true;
    };
  };
}
