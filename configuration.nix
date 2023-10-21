{ config, pkgs, ... }:

{
  imports =
    [
      ./applications/settings/git.nix
      
      ./system/hardware/hardware-configuration.nix
      ./system/hardware/network.nix
      ./system/hardware/sound.nix

      ./system/software/boot.nix
      ./system/software/xserver.nix
    ];

   time.timeZone = "Europe/Minsk";

   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     useXkbConfig = true;
   };

   nixpkgs.config.allowUnfree = true;

   users.users.athlo9sky = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       firefox
       tree
     ];
     password = "V9upSSqfAE9X7ck";
   };

   environment.systemPackages = with pkgs; [
     vim 
     wget
   ];

  system.stateVersion = "23.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

