{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nautilus
    shotcut
    # xfce.thunar
    # xfce.tumbler
  ];
}
