{ pkgs, ... }:

{
  home-manager.users.athlo9sky.programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.inlineSuggest.enabled" = true;
      "editor.minimap.enabled" = false;
      "editor.smoothScrolling" = false;
      "extensions.autoUpdate" = false;
      "extensions.ignoreRecommendations" = true;
      "files.associations" = { "logcat" = "logcat"; };
      "nix.enableLanguageServer" = true;
      "nix.formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "security.workspace.trust.untrustedFiles" = "open";
      "telemetry.telemetryLevel" = "off";
      "update.mode" = "manual";
      "editor.fontSize" = 15;
    };
    mutableExtensionsDir = false;
  };
  services.gnome.gnome-keyring.enable = true;

  home-manager.users.athlo9sky.xdg.mimeApps.defaultApplications = {
    # Don't abuse me by using LibreOffice or Thunderbird by default
    "text/plain" = "code.desktop";
    "text/xml" = "code.desktop";
  };
}
