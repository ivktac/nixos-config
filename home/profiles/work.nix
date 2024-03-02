{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../modules/programs/vscode
  ];

  home.packages = with pkgs; [
    blender
  ];
}
