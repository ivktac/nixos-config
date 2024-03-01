{
  inputs,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) home-manager;
in {
  imports = [
    ./debloat.nix
  ];

  services.xserver = {
    desktopManager.gnome.enable = true;

    displayManager = {
      autoLogin.enable = false;

      gdm = {
        enable = true;
        autoSuspend = false;
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      # Thumbnailers.
      ffmpegthumbnailer
    ];
  };

  home-manager.users.ivktac = {
    dconf = {
      enable = true;
      settings = with lib.gvariant; {
        "org/gnome/desktop/calendar".show-weekdate = true;

        "org/gnome/desktop/input-sources".sources = [
          (mkTuple ["xkb" "us"])
          (mkTuple ["xkb" "ua"])
        ];

        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          show-battery-percentage = true;
        };

        # Console seems to not be able to actually use the system font correctly,
        # but Monospace also appears to be the real system monospace font.
        "org/gnome/Console" = {
          use-system-font = false;
          custom-font = "Monospace 10";
        };

        "org/gnome/nautilus/preferences".default-folder-viewer = "list-view";
        "org/gnome/nautilus/list-view" = {
          default-zoom-level = "small";
          use-tree-view = true;
        };

        "org/gtk/gtk4/settings/file-chooser" = {
          show-hidden = true;
          sort-directories-first = true;
          view-type = "list";
        };

        "io/github/celluloid-player/celluloid" = {
          always-autohide-cursor = true;
          always-open-new-window = true;
          always-show-title-buttons = true;
          autofit-enable = true;
        };

        # Hidden/background programs only show up if they are flatpaks,
        # so disable background play for now.
        "io/bassi/Amberol".background-play = false;

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>Return";
          command = "/usr/bin/env kgx";
          name = "Terminal";
        };

        # This is necessary for some reason, or the above custom-keybindings don't work.
        "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
    };
  };
}
