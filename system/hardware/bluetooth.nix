{ pkgs, ... }:

{
  hardware = {
    bluetooth = {
      enable = false;
      package = pkgs.bluez5-experimental;
      settings.General.Experimental = true;
      #powerOnBoot = false;
    };
  };
}