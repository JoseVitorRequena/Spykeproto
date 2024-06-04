_:

{

	programs.git = {
		enable = true;
		
		userEmail = "josevitorrequena@gmail.com";
		userName = "SpykeTiger";
		
		extraConfig = {
			github.User = "SpykeTiger";
			init.defaultBranch = "master";
		};
	};

}
