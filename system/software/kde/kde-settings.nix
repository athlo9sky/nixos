{ inputs, pkgs, ... }: 

{
  time.timeZone = "Europe/Minsk";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; 
  };

  #services.printing.enable = true;
  programs.dconf.enable = true;
  environment.plasma5.excludePackages = with pkgs; [ elisa ];
  services.colord.enable = true;

  home-manager.users.athlo9sky = {
    imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
    programs.plasma = {
      enable = true;
      files = {
        dolphinrc = {
          General = {
            GlobalViewProps = false;
            ShowFullPath = true;
          };
        };

        kdeglobals = {
          Icons.Theme = "Papirus";
          KDE.SingleClick = false;
        };

        # kscreenlockerrc = {
        #   Daemon = {
        #     Timeout = 10; # min
        #     LockGrace = 7; # sec
        #   };
        # };

        ksmserverrc.General.loginMode = "restoreSavedSession";

        konsolerc = {
          "Desktop Entry".DefaultProfile = "default.profile";

          KonsoleWindow.RememberWindowSize = false;

          TabBar = {
            NewTabBehavior = "PutNewTabAfterCurrentTab";
            TabBarVisibility = "AlwaysShowTabBar";
            TabBarPosition = "Bottom";
          };
        };
        "../.local/share/konsole/default.profile" = {
          General = {
            Name = "default";
            TerminalColumns = 120;
            TerminalRows = 30;
          };
          Scrolling = {
            HistorySize = 50000;
          };
        };

        kwinrc = {
          NightColor.Active = false;
          #Xwayland.Scale = 1;
        };
      };
    };
  };
}
