{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Utilities for Info Center
    clinfo
    glxinfo
    vulkan-tools

    ark
    gwenview
    kate
    kompare
    kleopatra
    okular
    okteta

    # Ark dependency
    unrar

    # Icons
    papirus-icon-theme
  ] ++ lib.optional config.services.colord.enable gnome.gnome-color-manager;
}