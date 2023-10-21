{ pkgs, ... }:

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
        touchpad = {
          tappingDragLock = false;
          naturalScrolling = true;
        };
        mouse = {
          accelProfile = "flat";
          accelSpeed = "0";
        };
      };

    displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr -d :0 --output eDP-1 --set "scaling mode" "Full"
    '';

    };
  };
}