{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        "<C-p>" = {
          action = "git_files";
        };
        "<leader>fg" = {
          action = "live_grep";
        };
        "<leader>fb" = {
          action = "buffers";
        };
        "<leader>ff" = {
          action = "find_files";
        };
        "<leader>fs" = {
          action = "spell_suggest";
        };
      };
    };
  };
}
