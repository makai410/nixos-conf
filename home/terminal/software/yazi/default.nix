{ config
, pkgs
, ...
}: {
  imports = [
    ./theme/icons.nix
    ./theme/manager.nix
    ./theme/status.nix
  ];

  # general file info
  home.packages = [ pkgs.exiftool ];

  # yazi file manager
  programs.yazi = {
    enable = true;

    enableBashIntegration = config.programs.bash.enable;
    enableFishIntegration = config.programs.fish.enable;

    settings = {
      mgr = {
        layout = [ 1 4 3 ];
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };

      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = "${config.xdg.cacheHome}";
      };
    };
  };
}
