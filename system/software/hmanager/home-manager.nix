{ config, ... }:

{
  home-manager.users.athlo9sky = {
    home = {
      inherit (config.system) stateVersion;
    };
  };
}