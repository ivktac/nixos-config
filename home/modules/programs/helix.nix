{pkgs, ...}: {
  xdg.configFile."helix/themes".source = "${pkgs.nur.repos.ryan4yin.catppuccin-helix}/themes/default";

  programs.helix = {
    enable = true;
    package = pkgs.helix;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
      };
    };
  };
}
