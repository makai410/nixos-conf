{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    # get the basic config to build on top of
    inherit (import "${self}/system") desktop laptop;

    # get these into the module system
    specialArgs = {inherit inputs self;};
  in {
    zutomayo = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ laptop
        ++ [
          ./zutomayo
          "${mod}/programs/gamemode.nix"
          "${mod}/services/gnome-services.nix"
          "${mod}/services/location.nix"
          "${mod}/core/lanzaboote.nix"
          {
            home-manager = {
              users.makai.imports =
                homeImports."makai@zutomayo";
              extraSpecialArgs = specialArgs;
            };
          }

          inputs.agenix.nixosModules.default
          inputs.chaotic.nixosModules.default
        ];
    };
  };
}
