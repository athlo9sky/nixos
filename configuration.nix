{ config, pkgs, ... }:

{
  imports =
    [
      ./applications/settings/git.nix
      ./applications/systemapps.nix
      #./applications/userapps.nix
      
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

  system.stateVersion = "23.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

