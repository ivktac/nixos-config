{ lib, ... }:

{
  networking.networkmanager.enable = true;
  
  services = {
    gnome.glib-networking.enable = true;
  };
}
