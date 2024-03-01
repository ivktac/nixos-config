{ lib, pkgs, ...}:

{
  environment.pathsToLink = ["/share/fish"];
  
  programs = {
    less.enable = true;
    
    fish.enable = true;
    fish.promptInit = ''
      eval "$(${lib.getExe pkgs.starship} init fish)"
    '';
  };
}
