{pkgs, ...}:

{
  imports = [
    ./gnome/gnome-keyring.nix
    ./gnome/polkit-gnome.nix
    ./networking.nix
    ./openssh.nix
    ./pipewire.nix
  ];
  
  services = {
    accounts-daemon.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
    
    dbus = {
      enable = true;
      packages = with pkgs; [ dconf gcr udisks2 ];
    };
  };
}
