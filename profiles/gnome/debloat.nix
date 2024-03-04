{ config, ... }: {
  services = {
    # Due to the way desktop configuration works in Nixpkgs, we have to install
    # an X server even if we only use Wayland.
    xserver = {
      enable = true;

      # We can exclude these packages without breaking X in gnome-shell, even if
      # I almost never use it.
      excludePackages =
        [pkgs.xterm]
        ++ (with pkgs.xorg; [
          iceauth
          xauth
          xf86inputevdev
          xinput
          xlsclients
          xorgserver
          xprop
          xrandr
          xrdb
          xset
          xsetroot
        ]);
    };

    # Disable unused GNOME module features.
    avahi.enable = false;
    dleyna-renderer.enable = false;
    dleyna-server.enable = false;
    hardware.bolt.enable = false;
    gnome = {
      evolution-data-server.enable = true;
      gnome-browser-connector.enable = false;
      gnome-initial-setup.enable = false;
      gnome-online-accounts.enable = true;
      gnome-online-miners.enable = true;
      gnome-user-share.enable = false;
      rygel.enable = false;
    };
  };

  # Most of these are optional programs added by services.gnome.core-services
  # and etc., but the module sets other useful options so it is better to
  # exclude these instead of disabling the module.
  environment.gnome.excludePackages = with pkgs.gnome; [
    baobab # disk usage analyzer
    epiphany # web browser
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-music
    gnome-logs
    gnome-themes-extra
    pkgs.gnome-connections
    pkgs.gnome-tour
    pkgs.gnome-user-docs
    pkgs.orca # screen reader
    simple-scan
    totem # video player
    yelp # help viewer
  ];
}
