{pkgs, ...}: let
  editor = {
    "editor.bracketPairColorization.enabled" = true;
    "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
    "editor.cursorBlinking" = "smooth";
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.fontFamily" = "'Fira Code', 'Material Design Icons'";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 13;
    "editor.fontWeight" = "500";
    "editor.formatOnSave" = true;
    "editor.guides.bracketPairs" = true;
    "editor.guides.indentation" = true;
    "editor.inlineSuggest.enabled" = true;
    "editor.linkedEditing" = true;
    "editor.lineHeight" = 22;
    "editor.lineNumbers" = "relative";
    "editor.minimap.enabled" = false;
    "editor.renderLineHighlight" = "all";
    "editor.semanticHighlighting.enabled" = true;
    "editor.showUnused" = true;
    "editor.smoothScrolling" = true;
    "editor.tabCompletion" = "on";
    "editor.tabSize" = 2;
    "editor.trimAutoWhitespace" = true;
  };

  explorer = {
    "explorer.confirmDelete" = false;
    "explorer.confirmDragAndDrop" = false;
  };

  files = {
    "files.insertFinalNewline" = true;
    "files.trimTrailingWhitespace" = true;
  };

  telemetry = {
    "telemetry.telemetryLevel" = "off";
  };

  terminal = {
    "terminal.integrated.fontSize" = 13;
    "terminal.integrated.smoothScrolling" = true;
    "terminal.integrated.fontFamily" = "'Fira Code', 'Material Design Icons'";
  };

  window = {
    "window.autoDetectColorScheme" = true;
    "window.dialogStyle" = "native";
    "window.menuBarVisibility" = "toggle";
    "window.titleBarStyle" = "custom";
  };

  workbench = {
    "workbench.colorTheme" = "Catppuccin Macchiato";
    "workbench.iconTheme" = "catppuccin-macchiato";
    "workbench.panel.defaultLocation" = "bottom";
    "workbench.productIconTheme" = "icons-carbon";
    "workbench.sideBar.location" = "left";
    "workbench.startupEditor" = "none";
  };

  # Extension specific settings
  git = {
    "git.autofetch" = true;
    "git.enableCommitSigning" = true;
    "git.enableSmartCommit" = true;
  };

  github = {
    "github.copilot.enable" = {
      "*" = true;
    };
    "github.copilot.editor.enableAutoCompletions" = true;
  };

  path-intellisense = {
    "path-intellisense.autoSlashAfterDirectory" = true;
    "path-intellisense.autoTriggerNextSuggestion" = true;
    "path-intellisense.extensionOnImport" = true;
    "path-intellisense.showHiddenFiles" = true;
  };

  # Language specific settings
  # Formatter
  formatter = {
    "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
    "[python]"."editor.defaultFormatter" = "ms-python.black-formatter";
  };

  # Shell
  bash = {
    "bashIde.shellcheckPath" = "${pkgs.shellcheck}/bin/shellcheck";
    "shfmt.executablePath" = "${pkgs.shfmt}/bin/shfmt";
  };

  # Nix
  nix = {
    "nix.enableLanguageServer" = true;
    "nix.formatterPath" = "${pkgs.alejandra}/bin/alejandra";
    "nix.serverPath" = "${pkgs.nil}/bin/nil";
    "nix.serverSettings"."nil"."formatting"."command" = ["${pkgs.alejandra}/bin/alejandra"];
  };

  # Python
  python = {
    "python.defaultInterpreterPath" = "${pkgs.python3}/bin/python";
    "python.languageServer" = "Pylance";
    "python.analysis.typeCheckingMode" = "strict";
    "python.analysis.autoFormatStrings" = true;
  };
in {
  programs.vscode.userSettings =
    {
      "extensions.autoCheckUpdates" = false;
      "extensions.ignoreRecommendations" = true;
      "update.mode" = "none";
    }
    # General settings
    // editor
    // explorer
    // files
    // telemetry
    // terminal
    // window
    // workbench
    # Extension specific settings
    // git
    // github
    // path-intellisense
    # Language specific settings
    // formatter
    // bash
    // nix
    // python;
}
