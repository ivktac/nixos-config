{pkgs, ...}: {
  users.users.ivktac = {
    isNormalUser = true;
    home = "/home/ivktac";
    description = "Ivan Tkachuk";
    extraGroups = ["libvirtd" "networkmanager" "wheel"];
    shell = pkgs.bashInteractive;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOm9UvpGfoE4PZMc5LsIoghQmHjkg1sB2i1Hlpxiy1Lc git@tkachuk.email"
    ];
  };

  # The wheel group is a special user group,
  # which can access to the `su` or `sudo` command to run commands as super user.
  #
  # Don't ask for password for wheel group
  security.sudo.wheelNeedsPassword = false;
}
