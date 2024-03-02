{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../modules/programs/firefox.nix
    ../modules/programs/media
  ];

  home.packages = lib.attrValues {
    inherit
      (pkgs)
      curl
      du-dust
      fd
      file
      fira-code-nerdfont
      gawk
      glow
      gnumake
      gnused
      killall
      neofetch
      procs
      ripgrep
      rsync
      unzip
      wget
      yt-dlp
      zip
      ;

    inherit
      (pkgs)
      tdesktop
      tuba
      blender
      ;
  };
}
