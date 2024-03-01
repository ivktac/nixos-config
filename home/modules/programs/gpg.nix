{config, ...}: {
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
    settings = {
      use-agent = true;
      default-key = "B3694380B336C5A4";
    };
  };
  
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    enableSshSupport = true;
    enableFishIntegration = true;
  };
}
