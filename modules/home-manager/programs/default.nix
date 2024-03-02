{...}: {
  imports = [
    ./firefox.nix
    ./gpg.nix
    ./git.nix
    ./sh.nix
    ./starship.nix
    ./utils.nix
    ./helix.nix
    ./vscode
  ];

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;
}
