{
  pkgs,
  lib,
  ...
}: let
  shellAliases = with lib;
  with pkgs; {
    cat = "${getExe bat} --number --color=always --paging=never --tabs=2 --wrap=never";
    cp = "cp -iv";
    du = getExe du-dust;
    fcd = "cd $(find -type d | ${getExe fzf})";
    g = "git";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
    gs = "git status";
    grep = getExe ripgrep;
    la = "${getExe eza} -lah --tree";
    ls = "${getExe eza} -h --git --icons --color=auto --group-directories-first -s extension";
    mv = "mv -iv";
    ps = getExe procs;
    rebuild = "sudo nixos-rebuild switch --flake .#";
    rm = "rm -iv";
    tree = "${getExe eza} --tree --icons --tree";
    untar = "tar -xvf";
    untargz = "tar -xzf";
    ytmp3 = ''
      ${lib.getExe yt-dlp} --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata --output "%(title)s.%(ext)s"'';
  };
in {
  programs.bash = {
    inherit shellAliases;
    enable = true;
  };

  programs.fish = {
    inherit shellAliases;
    enable = true;
    plugins = with pkgs; [
      {
        name = "fzf-fish";
        src = fishPlugins.fzf-fish.src;
      }
      {
        name = "forgit";
        src = fishPlugins.forgit.src;
      }
    ];
  };
}
