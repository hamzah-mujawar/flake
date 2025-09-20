{ pkgs, lib, config, ... }: {
  options = {
    greeter.enable =
      lib.mkEnableOption "enables greeter";
  };
  config = lib.mkIf config.greeter.enable {
    services.greetd = {
      enable = true;
      settings = {
	default_session = {
	  command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
	  user = "greeter";
	};
      };
    };
  };
}
