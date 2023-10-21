{ config, pkgs, ... }:

{
  #sound.enable = true;
  security.rtkit.enable = true;

  hardware = {
    pulseaudio = {
      enable = false;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
    };
  };
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}