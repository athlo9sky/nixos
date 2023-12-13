{ config, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 6;
      };
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    initrd.systemd.enable = true;

    blacklistedKernelModules = [ "rtw88_8822ce" ];
    extraModulePackages = with config.boot.kernelPackages; [ rtl8821au ];
    initrd.kernelModules = [ "amdgpu" ];
  };
}