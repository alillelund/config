{
  description = "A nix-config across gaming machine and WSL work machine.";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    hyprland.url = "github:hyprwm/Hyprland";
    swww.url = "github:LGFae/swww";
    elephant.url = "github:abenz1267/elephant";
    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system;
      config.allowUnfree = true;
    };
    in {
    nixosConfigurations.nixos-3950x = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        hostname = "nixos-3950x";
      };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
      	  home-manager.users.aml = import ./home.nix;
        }
      ];
    };
    homeConfigurations."nixos@nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
    };
  };
}
