{ pkgs, lib, config, ... }: {
    options = {
      fish.enable =
            lib.mkEnableOption "enables fish";
    };
    config = lib.mkIf config.fish.enable {
      programs.fish.enable = true;
      environment.systemPackages = with pkgs;[
	fishPlugins.done
	fishPlugins.fzf-fish
	fishPlugins.forgit
	fishPlugins.hydro
	fzf
	fishPlugins.grc
	grc
      ];
    };
}
