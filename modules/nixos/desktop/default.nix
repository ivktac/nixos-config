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

  services.xserver.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  services.xserver.displayManager.gdm.enable = true;

  services.xserver.displayManager.autoLogin.enable = false;
  services.xserver.displayManager.gdm.autoSuspend = false;

  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
