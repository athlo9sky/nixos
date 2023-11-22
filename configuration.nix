{ config, pkgs, ... }:

{
  imports =
    [
      ./applications/settings/firefox.nix
      ./applications/settings/git.nix
      ./applications/settings/adb.nix
      ./applications/settings/fish.nix
      ./applications/settings/htop.nix
      ./applications/settings/starship.nix
      ./applications/settings/steam.nix
      ./applications/settings/vscode.nix
      ./applications/kde-packages.nix
      ./applications/system-packages.nix
      ./applications/user-packages.nix
      ./applications/settings/direnv.nix
      
      ./system/hardware/hardware-configuration.nix
      ./system/hardware/network.nix
      ./system/hardware/audio.nix
      ./system/hardware/bluetooth.nix
      ./system/hardware/memory.nix
      
      ./system/software/hmanager/home-manager.nix
      ./system/software/kde/kde-settings.nix
      ./system/software/boot.nix
      ./system/software/xserver.nix
      ./system/software/kernel.nix
      ./system/software/opengl.nix
      ./system/software/virtualisation.nix

      ./system/user.nix
    ];

  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org/"
      ];
    };
  };

  services.tailscale.enable = true;

  system.stateVersion = "23.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

