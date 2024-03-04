{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./services.nix
    ./networking.nix
    ./security.nix
    ./virtualization.nix
    ./hardware
  ];

  # add user's shell into /etc/shells
  environment.shells = with pkgs; [
    bash
    fish
  ];

  # set user's default shell system-wide
  users.defaultUserShell = pkgs.bash;

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

  programs = {
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };

  xdg.portal.enable = true;
}
