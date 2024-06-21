{
  programs.home-manager.enable = true;
  home = {
  	stateVersion = "24.05";
	username = "spyke";
	homeDirectory = "/home/spyke/";

	sessionVariables = {
		EDITOR =  "nvim";
		TERMINAL = "kitty";
		BROWSER = "firefox";
	};
  };
	
  xdg = {
  	enable = true;
	userDirs = {
		enable = true;
	};
  };

  imports = [ 
    ./apps
    ./git
    ./shell
    ./utilities
  ];
}
