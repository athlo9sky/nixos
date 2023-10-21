{ config, pkgs, ... }:

{
  imports =
    [
      ./applications/settings/firefox.nix
      ./applications/settings/git.nix
      ./applications/kde-packages.nix
      ./applications/system-packages.nix
      ./applications/user-packages.nix
      
      ./system/hardware/hardware-configuration.nix
      ./system/hardware/network.nix
      ./system/hardware/audio.nix
      
      ./system/software/hmanager/home-manager.nix
      ./system/software/kde/kde-settings.nix
      ./system/software/boot.nix
      ./system/software/xserver.nix
      ./system/user.nix
    ];

  system.stateVersion = "23.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

