{ pkgs, lib, config, inputs, ... }: {
    options = {
      niri.enable =
            lib.mkEnableOption "enables niri";
    };
    config = lib.mkIf config.niri.enable {
        programs.niri.enable = true;
	nixpkgs.overlays = [ niri.overlays.niri ];
	programs.niri.package = pkgs.niri-unstable;
    };
}
