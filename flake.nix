{
  description = "NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix/release-25.05";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, catppuccin, ... }: {
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
	catppuccin.nixosModules.catppuccin
	home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    useUserPackages = true;
	    users.marko = {
	      imports = [
	        ./home.nix
		catppuccin.homeModules.catppuccin
	      ];
            };
	    backupFileExtension = "backup";
	  };
	}
      ];
    };
  };
}
