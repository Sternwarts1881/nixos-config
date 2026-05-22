{
  description = "An improperly used flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable ,home-manager, ... } @ inputs:
let
    system = "x86_64-linux";

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config = {
        allowUnfree = true;
        cudaSupport = true;
      };
    };
  in
  {
    homeConfigurations = {
      flkr = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit self inputs pkgs-stable; };
        modules = [
          ./home
        ];
      };
    };

    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs pkgs-stable; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs pkgs-stable; };
            home-manager.users.flkr = import ./home/default.nix;
          }
        ];
      };
    };
  };
}
