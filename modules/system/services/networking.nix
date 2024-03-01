{lib, ...}: {
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  services = {
    gnome.glib-networking.enable = true;
  };
}
