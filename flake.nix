{
  description = "A simple NixOS flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/nixos-wsl";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, nixos-wsl, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    username = "nixos";
    pkgs = import nixpkgs { 
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username; };
        modules = [
          ./configuration.nix
          nixos-wsl.nixosModules.wsl
          home-manager.nixosModules.default
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
      	    home-manager.users."${username}" = import ./home.nix;
            home-manager.extraSpecialArgs = {inherit pkgs system username;};
          }
        ];
      };
    };
    homeConfigurations."nixos@nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
    };
  };
}
