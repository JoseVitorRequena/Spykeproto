{
  description = "Spyke but proto";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
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
			specialArgs = { inherit inputs; };
			modules = [
				./nixos/configuration.nix
			];
		};
	};
	
	};
}
