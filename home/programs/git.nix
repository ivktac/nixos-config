{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    delta.enable = true;
    
    userName = "ivktac";
    userEmail = "git@tkachuk.email";
    signing = {
      key = "B3694380B336C5A4";
      signByDefault = true;
    };
    
    extraConfig = {
      init.defaultBranch = "main";
      branch.autosetupmerge = "true";
      push.default = "current";
      merge.stat = "true";
      core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      repack.usedeltabaseoffset = "true";
      pull.ff = "only";
      rebase = {
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
    };
  };
}
