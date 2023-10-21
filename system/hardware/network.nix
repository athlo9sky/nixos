{ config, pkgs, ... }:

{
  networking = {
    hostName = "hp";
    networkmanager = {
      enable = true;
    };
  };
}