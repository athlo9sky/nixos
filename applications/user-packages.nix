{ pkgs, ... }:

{
  home-manager.users.athlo9sky = {
    home = {
      packages = with pkgs; [
        telegram-desktop
        github-desktop
        gitkraken
        lens
      # element-desktop
      # prismlauncher
        obs-studio
        discord
      # discord-canary
      # discord-gamesdk
      # discord-rpc
        bottles
        spotify
        vlc
      ];
    };
  };
}