{ ... }:

{
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 200;
  };
  
  boot.kernel.sysctl = {
    "vm.min_free_kbytes" = 157057;
    "vm.page-cluster" = 0;
    "vm.swappiness" = 200;
    "vm.vfs_cache_pressure" = 1000;
  };
}