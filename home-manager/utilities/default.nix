{ pkgs, ...}:

{
  imports = [
	./kitty.nix
	./ranger.nix
  ];
  
  home.packages = with pkgs; [
  	appimage-run
	pavucontrol
	ranger
  ];
}
