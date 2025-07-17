{inputs, ...}: {
  imports = [
    ./terminal
    inputs.nix-index-db.hmModules.nix-index
  ];
  home = {
    username = "makai";
    homeDirectory = "/home/makai";
    stateVersion = "24.05";
  };

  # disable manuals as nmd fails to build often
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  # let HM manage itself when in standalone mode
  programs.home-manager.enable = true;

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
}
