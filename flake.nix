{
  description = "Home Manager configuration of pauldeblicker";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nur, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."pauldeblicker" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          { nixpkgs.overlays = [ nur.overlay (import ./overlays) ]; }
          ./home
        ];
      };
    };
}
