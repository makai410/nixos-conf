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
    # xfce.thunar
    # xfce.tumbler
  ];
}
