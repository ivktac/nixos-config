{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [./hardware-configuration.nix];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = with pkgs; [
    acpi
    ffmpeg-full
    libva
    libva-utils
    mesa
    pciutils
    vulkan-extension-layer
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
  ];

  # Set the networking host name.
  networking.hostName = "nixos";

  services = {
    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Enable the ACPI daemon.
    acpid.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    xserver.libinput.enable = true;

    # Enable power-profiles-daemon, a DBus daemon that allows changing system behavior based upon user-selected power profiles.
    power-profiles-daemon.enable = true;

    # Enable Upower, a DBus service that provides power management support to applications
    upower = {
      enable = true;
      percentageLow = 30;
      percentageCritical = 20;
      percentageAction = 10;
      criticalPowerAction = "Hibernate";
    };
  };
}
