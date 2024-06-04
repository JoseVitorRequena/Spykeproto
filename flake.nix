{
	description = "Spyke but proto";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		home-manager = {
			nixpkgs.url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... }@inputs: 
		let
		system = "x86_64-linux";

	pkgs = import nixpkgs {
		inherit system;

		config = {
			allowUnfree = true;
		};
	};
	in
	{
		nixosConfigurations = {
			spykeproto = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs system; };
				modules = [
					./nixos/configuration.nix
				];
			};
		};
		
		homeConfigurations = {
			spyke = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home-manager/home.nix ];
				extraSpecialArgs = {
					inherit inputs;
				};
			};
		};
	};
}