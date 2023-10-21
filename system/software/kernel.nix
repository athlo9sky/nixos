{ pkgs, ... }:

{
  boot = {
    kernel = {
      sysctl = {
        "kernel.sysrq" = 1;
      };
    };
    kernelParams = [
      "quiet"
      "mitigations=off"
      "amd_pstate=active"
    ];
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}