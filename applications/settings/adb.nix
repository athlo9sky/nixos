{ config, pkgs, ... }:

{
  programs.adb.enable = true;
  users.users.athlo9sky.extraGroups = [ "adbusers" ];
}