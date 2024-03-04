{
  config,
  inputs,
  outputs,
  pkgs,
  lib,
  mylib,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.nh.nixosModules.default

    ./base

    ./desktop
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;

    sharedModules = [
      {home.stateVersion = lib.mkForce config.system.stateVersion;}
    ];

    extraSpecialArgs = {
      inherit inputs;
      inherit mylib;
      outputs = inputs.self.outputs;
    };

    users.ivktac = {
      imports = [
        outputs.homeManagerModules.default
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    git # used by nix flakes
    git-lfs # used by huggingface models

    # archives
    zip
    xz
    zstd
    unzip
    p7zip

    # Text Processing
    # Docs: https://github.com/learnbyexample/Command-line-text-processing
    gnugrep # GNU grep, provides `grep`/`egrep`/`fgrep`
    gnused # GNU sed, very powerful(mainly for replacing text in files)
    gawk # GNU awk, a pattern scanning and processing language
    jq # A lightweight and flexible command-line JSON processor
    fd
    ripgrep

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    wget
    curl
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    file
    findutils
    which
    tree
    gnutar
    rsync
  ];
}
