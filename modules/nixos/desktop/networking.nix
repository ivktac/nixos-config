{...}: {
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  services.gnome.glib-networking.enable = true;
}
