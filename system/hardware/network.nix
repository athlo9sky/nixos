{ ... }:

{
  networking = {
    hostName = "hp";
    networkmanager = {
      enable = true;
    };
  };

  # boot.kernel.sysctl = {
  #   "net.ipv4.ip_default_ttl" = 65;
  #   "net.ipv6.conf.all.hop_limit" = 65;
  #   "net.ipv6.conf.default.hop_limit" = 65;
  #   "net.ipv6.conf.lo.hop_limit" = 65;
  #   "net.ipv6.conf.wlp4s0.hop_limit" = 65;

  #   "net.core.default_qdisc" = "fq";
  #   "net.core.netdev_max_backlog" = "16384";
  #   "net.ipv4.tcp_congestion_control" = "bbr2";
  #   "net.ipv4.tcp_ecn" = 1;
  #   "net.ipv4.tcp_keepalive_intvl" = 10;
  #   "net.ipv4.tcp_keepalive_probes" = 6;
  #   "net.ipv4.tcp_keepalive_time" = 30;
  #   "net.ipv4.tcp_low_latency" = 1;
  #   "net.ipv4.tcp_mtu_probing" = 1;
  #   "net.ipv4.tcp_notsent_lowat" = "16384";
  #   "net.ipv4.tcp_slow_start_after_idle" = 0;
  #   "net.ipv4.tcp_tw_reuse" = 1;
  # };
}