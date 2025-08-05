{ pkgs, lib, config, ... }: {
    options = {
        dwm.enable =
            lib.mkEnableOption "enables dwm";
    };
    config = lib.mkIf config.dwm.enable {
      services.xserver.windowManager.dwm.enable = true;
    };
}
