{ user, ... }:
{
  stylix.targets = {
    waybar.enable = false;
    tmux.enable = true;
    fish.enable = false;
    firefox.enable = false;
    firefox.profileNames = [ "${user}" ];
    mangohud.enable = false;
    gnome.enable = true;
    nixvim.enable = true;
    hyprland.enable = true;
    mpv.enable = false;
  };
}
