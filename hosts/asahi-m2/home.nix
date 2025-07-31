{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nautilus
    shotcut
    vscode
    clash-verge-rev
    mihomo
    # xfce.thunar
    # xfce.tumbler
  ];
}
