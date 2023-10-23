{ pkgs, ... }:

{
  home-manager.users.athlo9sky = {
    home = {
      packages = with pkgs; [
        telegram-desktop
        element-desktop
        prismlauncher
        obs-studio
        discord-canary
        discord-gamesdk
        discord-rpc
        bottles
        spotify
      ];
    };
  };
}