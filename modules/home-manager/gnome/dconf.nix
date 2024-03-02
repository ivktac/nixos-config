{lib, ...}: {
  dconf = {
    enable = true;
    settings = with lib.gvariant; {
      "org/gnome/desktop/calendar".show-weekdata = true;

      "org/gnome/desktop/input-sources".sources = [
        (mkTuple ["xkb" "us"])
        (mkTuple ["xkb" "ua"])
      ];

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        show-battery-percentage = true;
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
}
