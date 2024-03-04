{ pkgs, ... }: {
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    accounts-daemon.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    flatpak.enable = false;

    dbus = {
      enable = true;
      packages = with pkgs; [
        dconf
        gcr
        udisks2
      ];
    };
  };

  services.xserver.libinput.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
