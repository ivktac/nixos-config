{
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-b>";
        options = {silent = true;};
      }
    ];
  };
}
