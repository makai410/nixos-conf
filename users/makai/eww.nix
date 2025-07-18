{ config, pkgs, nixpkgs, ... }:
{
  programs.eww = {
    enable = true;
    configDir = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/users/makai/eww";
  };
}