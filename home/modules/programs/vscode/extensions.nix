{pkgs, ...}: {
  programs.vscode = {
    mutableExtensionsDir = true;
    extensions =
      (with pkgs.vscode-extensions; [
        github.vscode-github-actions
        github.vscode-pull-request-github
      ])
      ++ (with pkgs.vscode-marketplace; [
        antfu.icons-carbon
        catppuccin.catppuccin-vsc-icons
        christian-kohler.path-intellisense
        editorconfig.editorconfig
        github.copilot
        github.copilot-chat
        jnoortheen.nix-ide
        llvm-vs-code-extensions.vscode-clangd
        mads-hartmann.bash-ide-vscode
        mikestead.dotenv
        mkhl.direnv
        mkhl.shfmt
        ms-python.black-formatter
        ms-python.isort
        ms-python.pylint
        ms-python.python
        ms-python.vscode-pylance
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        ms-toolsai.jupyter-keymap
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        naumovs.color-highlight
        oderwat.indent-rainbow
        redhat.vscode-yaml
        usernamehw.errorlens
        yzhang.markdown-all-in-one
      ])
      ++ (with pkgs.vscode-marketplace-release; [
        eamodio.gitlens
        vadimcn.vscode-lldb
      ])
      ++ [
        (pkgs.catppuccin-vsc.override {
          accent = "blue";
          boldKeywords = true;
          italicComments = true;
          italicKeywords = true;
          extraBordersEnabled = false;
          workbenchMode = "default";
          bracketMode = "rainbow";
          customUIColors = {
            all = {
              "statusBar.foreground" = "accent";
              "statusBar.noFolderForeground" = "accent";
            };
          };
        })
      ];
  };
}
