{...}: {
  imports = [
    ./firefox.nix
    ./gpg.nix
    ./git.nix
    ./sh.nix
    ./starship.nix
    ./utils.nix
    ./helix.nix
    ./media.nix
    ./vscode
    ./nixvim
  ];

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;
}
