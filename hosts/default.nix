{
  lib,
  inputs,
  user,
  ...
}:
let
  moduleProfiles = {
    input = {
      system = [
        ../modules/input/input.nix
      ];
    };
    dae = {
      system = [
        ../modules/dae/dae.nix
      ];
    };
    laptop = {
      system = [
        ../modules/common/laptop.nix
        ../modules/common/fingerprint-scanner.nix
      ];
    };
    impermanence = {
      system = [
        inputs.disko.nixosModules.disko
        ../modules/disko/encrypted-btrfs-impermanence.nix
        inputs.impermanence.nixosModules.impermanence
        ../modules/impermanence/default.nix
      ];
    };
    bootloader-systemd-boot = {
      system = [
        ../modules/common/bootloader-systemd-boot.nix
      ];
    };
    bootloader-systemd-boot-asahi = {
      system = [
        ../modules/common/bootloader-systemd-boot-asahi.nix
      ];
    };
    bootloader-grub = {
      system = [
        ../modules/common/bootloader-grub-uefi.nix
      ];
    };
    personal = {
      home = [
        ../apps/ledger/ledger.nix
        ../apps/mpv/mpv.nix
        ../apps/nextcloud-client/nextcloud-client.nix
      ];
    };
    niri = {
      system = [
        ../apps/niri/default.nix
        ../apps/hyprlock/default.nix
      ];
      home = [
        inputs.niri.homeModules.niri
        inputs.niri.homeModules.stylix
        ../apps/niri/niri.nix
        ../apps/hyprlock/hyprlock.nix
        ../apps/hypridle/hypridle.nix
        ../apps/autoscreen/autoscreen.nix
        ../apps/tofi/tofi.nix
        ../apps/anyrun/anyrun.nix
        ../apps/waybar/waybar.nix
        ../apps/mako/mako.nix
        ../apps/gammastep/gammastep.nix
      ];
    };
    hyprland = {
      system = [
        ../apps/hyprland/default.nix
        ../apps/hyprlock/default.nix
      ];
      home = [
        inputs.hyprland.homeManagerModules.default
        ../apps/hyprland/hyprland.nix
        ../apps/hyprlock/hyprlock.nix
        ../apps/hypridle/hypridle.nix
        ../apps/autoscreen/autoscreen.nix
        ../apps/autoscreen-gaming/autoscreen-gaming.nix
        ../apps/waybar/waybar.nix
        ../apps/tofi/tofi.nix
        ../apps/mako/mako.nix
        ../apps/gammastep/gammastep.nix
      ];
    };
    gnome = {
      system = [
        ../apps/gnome/default.nix
      ];
      home = [
        ../apps/gnome/gnome.nix
        ../apps/autoscreen-gnome/autoscreen-gnome.nix
      ];
    };
    sway = {
      system = [
        ../apps/swaylock/default.nix
      ];
      home = [
        ../apps/sway/sway.nix
        ../apps/swaylock/swaylock.nix
        ../apps/waybar/waybar.nix
        ../apps/tofi/tofi.nix
        ../apps/mako/mako.nix
        ../apps/gammastep/gammastep.nix
        ../apps/autoscreen/autoscreen.nix
      ];
    };
    steam = {
      system = [
        ../modules/common/xbox.nix
        ../apps/steam/default.nix
      ];
      home = [ ../apps/steam/steam.nix ];
    };
    docker = {
      system = [
        ../apps/docker/default.nix
      ];
    };
    podman = {
      system = [
        ../apps/podman/default.nix
      ];
    };
    firefox = {
      home = [ ../apps/firefox/firefox.nix ];
    };
    chromium = {
      home = [ ../apps/ungoogled-chromium/ungoogled-chromium.nix ];
    };
    mpd = {
      home = [
        ../apps/mpd/mpd.nix
        ../apps/mpdscrobble/mpdscrobble.nix
      ];
    };
    python = {
      home = [
        ../apps/direnv/direnv.nix
        ../apps/python/python.nix
      ];
    };
    neovim-nvf = {
      home = [
        inputs.nvf.homeManagerModules.default
        ../apps/neovim-nvf/neovim-nvf.nix
      ];
    };
    android-tools = {
      system = [
        ../apps/android/default.nix
      ];
    };
    vscode = {
      home = [
        ../apps/vscode/vscode.nix
      ];
    };
    qutebrowser = {
      home = [ ../apps/qutebrowser/qutebrowser.nix ];
    };
    emacs = {
      home = [ ../apps/emacs/emacs.nix ];
    };
    kakoune = {
      home = [ ../apps/kakoune/kakoune.nix ];
    };
    obs = {
      home = [ ../apps/obs/obs.nix ];
    };
    pycharm = {
      home = [ ../apps/pycharm/pycharm.nix ];
    };
    zen-browser = {
      home = [ ../apps/zen-browser/zen-browser.nix ];
    };
  };
  mkHost =
    {
      hostName,
      stateVersion,
      system ? "x86_64-linux",
      profiles ? [ ],
      extraModules ? [ ],
      extraHomeModules ? [ ],
      homeConfig ? ../hosts/${hostName}/home.nix,
      baseConfig ? ../modules/configuration.nix,
    }:
    let
      # Extract system modules from profiles
      systemModules = lib.concatMap (
        profile:
        if moduleProfiles ? ${profile} && moduleProfiles.${profile} ? system then
          moduleProfiles.${profile}.system
        else
          [ ]
      ) profiles;

      # Extract home-manager modules from profiles
      homeModules = lib.concatMap (
        profile:
        if moduleProfiles ? ${profile} && moduleProfiles.${profile} ? home then
          moduleProfiles.${profile}.home
        else
          [ ]
      ) profiles;
    in
    lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit
          user
          inputs
          hostName
          stateVersion
          ;
      };
      modules =
        [
          baseConfig
          ../modules/overlays.nix
          ../modules/cachix/cachix.nix
          inputs.stylix.nixosModules.stylix
          ../apps/stylix/default.nix
          ../apps/udiskie/default.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit
                  user
                  inputs
                  system
                  stateVersion
                  ;
                selectedProfiles = profiles;
              };
              users.${user} = {
                imports =
                  [
                    ../hosts/home-manager-common-config.nix
                    ../apps/stylix/stylix.nix
                    ../apps/git/git.nix
                    ../apps/lazygit/lazygit.nix
                    ../apps/fish/fish.nix
                    ../apps/tmux/tmux.nix
                    ../apps/kitty/kitty.nix
                    ../apps/helix/helix.nix
                    ../apps/nnn/nnn.nix
                    ../apps/yazi/yazi.nix
                    ../apps/udiskie/udiskie.nix
                    ../apps/mime/mime.nix
                    ../apps/imv/imv.nix
                    ../apps/bat/bat.nix
                    ../apps/zoxide/zoxide.nix
                    ../apps/zathura/zathura.nix
                    ../apps/tealdeer/tealdeer.nix
                    homeConfig
                  ]
                  ++ homeModules
                  ++ extraHomeModules;
              };
            };
          }
          ../hosts/${hostName}/hardware-configuration.nix
        ]
        ++ systemModules
        ++ extraModules;
    };
in
{
  pc-ztmy = mkHost {
    hostName = "pc-ztmy";
    stateVersion = "25.05";
    profiles = [
      "bootloader-systemd-boot"
      "input"
      "dae"
      "niri"
      "steam"
      # "firefox"
      "zen-browser"
      "chromium"
      "obs"
      "python"
    ];
    extraModules = [
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-gpu-amd
      {
        my.stylix.wallpaper = "warma-moon";
      }
    ];
    extraHomeModules = [
    ];
  };

  asahi-m2 = mkHost {
    hostName = "asahi-m2";
    stateVersion = "25.11";
    system = "aarch64-linux";
    profiles = [
      "bootloader-systemd-boot-asahi"
      "input"
      "dae"
      "niri"
      "zen-browser"
      "chromium"
      "python"
    ];
    extraModules = [
      inputs.apple-silicon.nixosModules.apple-silicon-support
      {
        my.stylix.wallpaper = "warma-moon";
      }
    ];
    extraHomeModules = [
    ];
    baseConfig = ../modules/asahi-configuration.nix;
  };
}
