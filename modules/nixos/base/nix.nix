{
  config,
  lib,
  inputs,
  ...
}: {
  nix = {
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;
  };

  nix.channel.enable = false; # remove nix-channel related tools & configs, we use flakes instead.

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    inputs.catppuccin-vsc.overlays.default
    inputs.nix-vscode-extensions.overlays.default
    inputs.nur.overlay
  ];

  nix.settings = {
    auto-optimise-store = true;
    builders-use-substitutes = true;
    experimental-features = ["nix-command" "flakes"];

    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    trusted-users = ["root" "@wheel"];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  environment.variables.FLAKE = "/home/ivktac/.dotfiles";

  nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };
}
