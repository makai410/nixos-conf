{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "makai@zutomayo" = [
      ../.
      ./zutomayo
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfiguration = {
      "makai_zutomayo" = homeManagerConfiguration {
        modules = homeImports."makai@zutomayo";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
