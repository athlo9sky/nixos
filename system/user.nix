{ pkgs, ... }:

{
  users.users.athlo9sky = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
    password = "V9upSSqfAE9X7ck";
  };
}