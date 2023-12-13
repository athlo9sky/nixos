{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim 
    wget
    keepassxc
    tree
    dua
    gtk3
    gtk2
    gtk3-x11
  ];
}