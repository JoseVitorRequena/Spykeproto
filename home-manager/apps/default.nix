{ pkgs, inputs, ... }: 
 
{
	programs.btop.enable = true;
	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = _: true;
		};
	};

	home.packages = with pkgs; [
		cowsay
		python312Full
		python311Packages.pygments
		python312Packages.pip
		python312Packages.tkinter	
		git-lfs
		neofetch
		jdk
		inputs.nixvim.packages."x86_64-linux".default
	];
}

