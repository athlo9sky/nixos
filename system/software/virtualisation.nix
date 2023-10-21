{ pkgs, ...}:

{
  virtualisation = {
    waydroid.enable = false;
    podman.enable = false;
    docker.enable = false;
    spiceUSBRedirection.enable = false;
    # libvirtd = {
    #   enable = false;
    #   qemu.package = pkgs.qemu_kvm;
    # };
  };
}