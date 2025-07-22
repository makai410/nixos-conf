{
  pkgs,
  user,
  stateVersion,
  ...
}:
{
  home.username = user;
  home.homeDirectory = "/home/${user}";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "${stateVersion}";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.mpris-proxy.enable = true;

  home.packages = with pkgs; [
    brightnessctl
    btop
    cachix
    eza
    fastfetch
    fd
    ffmpeg
    ffmpegthumbnailer
    gnome-system-monitor
    htop
    imagemagick
    jq
    just
    keepassxc
    libreoffice-fresh
    ncdu
    nitch
    pavucontrol
    ripgrep
    ripgrep-all
    unzip
    yt-dlp
    rustup
    telegram-desktop
    zulip
    (symlinkJoin {
      name = "vesktop";
      paths = [ vesktop ];
      buildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/vesktop --add-flags "--wayland-text-input-version=3"
      '';
    })
  ];

  home.file.".config/fastfetch/config.jsonc".text = ''
//   _____ _____ _____ _____ _____ _____ _____ _____ _____ 
//  |   __|  _  |   __|_   _|   __|   __|_   _|     |  |  |
//  |   __|     |__   | | | |   __|   __| | | |   --|     |
//  |__|  |__|__|_____| |_| |__|  |_____| |_| |_____|__|__|  ASCII-ART
//
//  by Bina

 
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "source": "nixos_small",
        "padding": {
            "top": 3,
            "right": 3
        }
    },
    "display": {
        "separator": " •  "
    },
    "modules": [
	"break",
	"break",
	{
            "type": "title",
            "color": {
                "user": "32",  // = color2
                "at": "37",
                "host": "32"
            }
        },
        "break",
        {
            "type": "os",
            "key": "distribution   ",
            "keyColor": "33",
        },
        {
            "type": "kernel",
            "key": "linux kernel   ",
            "keyColor": "33",
        },
        {
            "type": "packages",
            "format": "{} (pacman)",
            "key": "packages       ",
            "keyColor": "33",  
        },
        {
            "type": "shell",
            "key": "unix shell     ",
            "keyColor": "33", 
        },
        {
            "type": "terminal",
            "key": "terminal       ",
            "keyColor": "33", 
        },
        {
            "type": "wm",
            "format": "{} ({3})",
            "key": "window manager ",
            "keyColor": "33", 
        },
        "break",
        {
            "type": "colors",
            "symbol": "circle",
        },
        "break",
        "break",
    ]
}
  '';
}
