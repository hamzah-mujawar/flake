{ pkgs, lib, config, ... }: {
    options = {
      sway.enable =
            lib.mkEnableOption "enables sway";
    };
    config = lib.mkIf config.sway.enable {
      programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
      };
    };
}
