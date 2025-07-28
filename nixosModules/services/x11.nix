{ pkgs, lib, config, ... }: {
    options = {
        x11.enable =
            lib.mkEnableOption "enables x11";
    };
    config = lib.mkIf config.x11.enable {
        services.xserver.enable = true;
        # Configure keymap in X11
        services.xserver.xkb = {
            layout = "us";
            variant = "";
        };
    };
}