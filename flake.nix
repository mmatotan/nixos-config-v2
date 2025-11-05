{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixvim = {
    #  url = "github:nix-community/nixvim/nixos-25.05";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, ... }: { # nixvim commented out
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = let
        system = "x86_64-linux";
      in {
      	nixpkgs-unstable = import nixpkgs-unstable {
	        inherit system;
	      };
      };
      modules = [
	      ./configuration.nix
	      home-manager.nixosModules.home-manager
	      {
	        home-manager = {
	          useGlobalPkgs = true;
	          useUserPackages = true;
            extraSpecialArgs = let
              system = "x86_64-linux";
            in {
      	      nixpkgs-unstable = import nixpkgs-unstable {
	              inherit system;
	            };
            }; 
	          users.marko = {
	            imports = [
                ./home.nix
                #nixvim.homeManagerModules.nixvim
	            ]; 
            };
	          backupFileExtension = "backup";
	        };
	      }
      ];
    };
  };
}
