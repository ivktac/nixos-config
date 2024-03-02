{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./hardware.nix
    ./networking.nix
    ./security.nix
    ./virtualization.nix
  ];

  # add user's shell into /etc/shells
  environment.shells = with pkgs; [
    bashInteractive
    fish
  ];

  # set user's default shell system-wide
  users.defaultUserShell = pkgs.bashInteractive;

  # fix for `sudo xxx` in kitty/wezterm and other modern terminal emulators
  security.sudo.keepTerminfo = true;

  environment.variables = {
    # fix https://github.com/NixOS/nixpkgs/issues/238025
    TZ = "${config.time.timeZone}";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gnumake
    # Thumbnailers
    ffmpegthumbnailer
  ];

  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    accounts-daemon.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    flatpak.enable = true;

    dbus = {
      enable = true;
      packages = with pkgs; [
        dconf
        gcr
        udisks2
      ];
    };
  };

  programs = {
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
  ];

  # Debloat GNOME
  services = {
    xserver = {
      # Due to the way desktop configuration works in Nixpkgs, we have to install
      # an X server even if we only use Wayland.
      enable = true;

      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;

      displayManager.gdm.enable = true;
      displayManager.autoLogin.enable = false;
      displayManager.gdm.autoSuspend = false;
      desktopManager.gnome.enable = true;

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

    # Disable unused  GNOME module features.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
