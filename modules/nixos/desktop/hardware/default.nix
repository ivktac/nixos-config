{pkgs,...}:
{
  imports = [
    ./media.nix
  ];

  # Enable bluetooth and all firmware
  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware = true;

  # Enable opengl and dri support
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # enable location services
  location.provider = "geoclue2";

  services = {
    printing.enable = true;
    geoclue2.enable = true;
    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
    ];
  };
}
