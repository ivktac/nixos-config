{ lib, ... }: {
  location.provider = "geoclue2";
  services.geoclue2.enable = true;

  time = {
    timeZone = lib.mkDefault "Europe/Kyiv";
    hardwareClockInLocalTime = lib.mkDefault true;
  };
}
