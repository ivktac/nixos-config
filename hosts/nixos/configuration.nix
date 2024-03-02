{lib, pkgs, ...}: {
  imports = [./hardware-configuration.nix];

  # Custom kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  system.stateVersion = lib.mkDefault "23.11";
}
