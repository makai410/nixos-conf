{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "makai@aesthetic" = [
      ../.
      ./aesthetic
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfiguration = {
      "makai_aesthetic" = homeManagerConfiguration {
        modules = homeImports."makai@aesthetic";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
