{ config, pkgs, ... }:

{
  home-manager.users.athlo9sky = {
    home = {
      packages = with pkgs; [
        tree
      ];
    };
  };
}