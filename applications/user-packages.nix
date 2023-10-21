{ pkgs, ... }:

{
  home-manager.users.athlo9sky = {
    home = {
      packages = with pkgs; [
        telegram-desktop
        discord-canary
        discord-gamesdk
        discord-rpc
        discord-ptb
        keepassxc
        tree
      ];
    };
  };
}