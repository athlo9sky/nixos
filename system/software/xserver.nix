{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      layout = "us,ru";
      xkbOptions = "grp:alt_shift_toggle";
      libinput = {
        enable = true;
      };
    };
  };
}