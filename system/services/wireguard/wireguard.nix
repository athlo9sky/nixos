{ lib, ... }:

{
  networking.wg-quick.interfaces = {
    "cloudflare" = {
      privateKey = "EBbQiTwTFqUkKa6Wg1jOpowZJFsF4SukKbyNJCYw9G8=";
      address = [ "172.16.0.2/32"];
      dns = [ "1.1.1.1" ];
      mtu = 1280;
      peers = [
        {
          publicKey = "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "engage.cloudflareclient.com:2408";
          persistentKeepalive = 5;
        }
      ];
    };
  };

  systemd.services = {
    "wg-quick-cloudflare" = {
      wantedBy = lib.mkForce [ ];
    };
  };
}