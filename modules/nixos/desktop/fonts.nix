{pkgs, ...}: {
  fonts = {
    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;
    fontDir = {
      enable = true;
      decompressFonts = true;
    };

    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk

      source-sans
      source-serif
      source-han-sans
      source-han-serif

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/data/fonts/nerdfonts/shas.nix
      (nerdfonts.override {
        fonts = [
          # symbols icon only
          "NerdFontsSymbolsOnly"
          # Characters
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
      julia-mono
      dejavu_fonts
    ];

    fontconfig = {
      enable = true;

      antialias = true;

      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };

      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };

      defaultFonts = {
        serif = ["Source Han Serif SC" "Source Han Serif TC" "Noto Color Emoji"];
        ansSerif = ["Source Han Sans SC" "Source Han Sans TC" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji" "Symbols Nerd Font"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
