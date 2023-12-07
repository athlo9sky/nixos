{ pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;
      settings.General.Experimental = true;
      #powerOnBoot = false;
    };
  };
}