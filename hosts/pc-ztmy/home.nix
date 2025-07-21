{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nautilus
    shotcut
    vscode
    # xfce.thunar
    # xfce.tumbler
  ];
}
