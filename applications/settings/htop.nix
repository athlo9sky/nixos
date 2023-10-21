{ lib, ... }:

{
  home-manager.users.athlo9sky.programs.htop = {
    enable = true;
    settings = lib.mkMerge [
      {
        config_reader_min_version = 3;
        detailed_cpu_time = true;
        header_margin = true;
        hide_kernel_threads = false;
        hide_userland_threads = true;
        highlight_base_name = true;
        show_cpu_usage = true;
        show_program_path = true;
        show_cpu_frequency = true;
        show_cpu_temperature = true;
        header_layout = "two_50_50";
        column_meters_0 = [ "LeftCPUs2" "Memory" "Swap" "Zram" ];
        column_meter_modes_0 = [ 1 1 1 1 ];
        column_meters_1 = [ "RightCPUs2" "Tasks" "LoadAverage" "Uptime" "DiskIO" ];
        column_meter_modes_1 = [ 1 2 2 2 2 ];
      }
    ];
  };
}