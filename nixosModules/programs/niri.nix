{ pkgs, lib, config, inputs, ... }: {
    options = {
      niri.enable =
            lib.mkEnableOption "enables niri";
    };
    config = lib.mkIf config.niri.enable {
        programs.niri.enable = true;
	programs.niri.package = pkgs.niri-unstable;
    };
}
