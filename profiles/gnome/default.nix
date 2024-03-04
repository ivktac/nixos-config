{ config, ... }: {
  imports = [
    ./debloat.nix
  ];

  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager = {
      # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
      # Suggested workaround (disabling "getty@tty1" and "autovt@tty1"
      # works, but as I do not use autoLogin anyway, this should suffice.
      autoLogin.enable = false;

      gdm = {
        enable = true;
        autoSuspend = false;
      };
    };
  };

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
  ];

  systemPackages = with pkgs; [
    adw-gtk3
  ];

  sessionVariables.GTK_THEME = "adw-gtk3-dark";
}
