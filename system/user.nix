{ config, pkgs, ... }:

{
  users.users.athlo9sky = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      firefox
      tree
    ];
    password = "V9upSSqfAE9X7ck";
  };
}