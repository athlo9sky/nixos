{ pkgs, ... }:

{
  home-manager.users.athlo9sky = {
    home = {
      packages = with pkgs; [
        telegram-desktop
        github-desktop
        lens
        wireshark
        winbox #MikroTik
        ciscoPacketTracer8
      # element-desktop
      # prismlauncher
        obs-studio
        arp-scan
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