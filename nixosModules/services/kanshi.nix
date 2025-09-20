{ pkgs, lib, config, ... }: {
  options = {
    kanshi.enable =
      lib.mkEnableOption "enables kanshi";
  };
  config = lib.mkIf config.kanshi.enable {
  	description = "kanshi daemon";
	environment = {
		WAYLAND_DISPLAY = "wayland-1";
		DISPLAY = ":0";
	};
	serviceConfig = {
		Type = "simple";
		ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
	};
  };
}
