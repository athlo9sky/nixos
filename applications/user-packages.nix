{ pkgs, ... }:

{
  home-manager.users.athlo9sky = {
    home = {
      packages = with pkgs; [
        telegram-desktop
        discord-canary
        discord-rpc
        keepassxc
        tree
      ];
    };
  };
}