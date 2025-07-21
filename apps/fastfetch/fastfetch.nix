{ pkgs, lib, ... }:
{
  programs.fastfetch = {
    enable = true;
    extraConfig = lib.fileContents ./config.jsonc;
  };
}
