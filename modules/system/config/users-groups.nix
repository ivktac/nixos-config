{ pkgs, ...}: {
  users.users.ivktac = {
    isNormalUser = true;
    description = "Ivan Tkachuk";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOm9UvpGfoE4PZMc5LsIoghQmHjkg1sB2i1Hlpxiy1Lc git@tkachuk.email"
    ];
  };
}
