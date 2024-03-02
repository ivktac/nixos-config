{pkgs, ...}: {
  home.packages = with pkgs; [
    amberol
    celluloid
    loupe
  ];

  xdg.mimeApps.defaultApplications = {
    "audio/*" = "io.bassi.Amberol";
    "image/*" = "org.gnome.Loupe";
    "video/*" = "io.github.celluloid_player.Celluloid";
  };
}
