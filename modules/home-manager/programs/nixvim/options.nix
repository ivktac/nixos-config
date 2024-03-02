{
  programs.nixvim = {
    options = {
      encoding = "utf-8";
      laststatus = 3;

      number = true;
      relativenumber = true;

      linespace = 0;

      termguicolors = true;
      colorcolumn = "80";
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      backspace = "indent,eol,start";

      autoread = true;
      ruler = true;
      showcmd = true;
      scrolloff = 8;
      incsearch = true;

      mouse = "a";
      belloff = "all";

      guicursor = "";
    };

    globals = {
      mapleader = " ";
    };
  };
}
