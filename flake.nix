{
	description = "Spyke but proto";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim.url = "github:SpykeTiger/BananaBread";	
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: 
	let
		system = "x86_64-linux";

		pkgs = import nixpkgs {
			inherit system;
			config = { allowUnfree = true; };
		};
	in
	{

		nixosConfigurations = {
			spykeproto = nixpkgs.lib.nixosSystem {		
				modules = [ ./nixos/configuration.nix ];
				specialArgs = { inherit inputs system; };
			};
		};

		homeConfigurations = {
			spyke = home-manager.lib.homeManagerConfiguration {	
				inherit pkgs;
				modules = [ ./home-manager/home.nix ];
				extraSpecialArgs = { inherit inputs; };
			};
		};

	};
}
