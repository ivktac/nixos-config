{pkgs, ...}: {
  home.packages = with pkgs; [
    act
    gist
    gitflow
    zsh-forgit
  ];

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

    aliases = {
      a = "add";
      af = "!git add $(git ls-files -m -o --exclude-standard | fzf)";
      amend = "commit --amend";
      b = "branch";
      br = "branch";
      branches = "branch -v -a";
      c = "commit";
      ca = "commit --amend";
      cerf = "checkout --";
      cm = "commit -m";
      co = "checkout";
      d = "diff";
      discard = "checkout --";
      ds = "diff --staged";
      edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; hx `f`";
      fa = "fetch --all";
      fuck = "commit --amend -m";
      graph = "log --all --decorate --graph --oneline";
      hist = "log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all";
      l = "log";
      llog = "log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative";
      ls = "ls-files";
      nevermind = "reset --hard HEAD";
      p = "push";
      pf = "push --force-with-lease";
      pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
      ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
      r = "rebase";
      remotes = "remote -v";
      uncommit = "reset --mixed HAED~";
      undo = "reset --soft HEAD~1";
      s = "status --short";
      ss = "status";
      st = "status";
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
