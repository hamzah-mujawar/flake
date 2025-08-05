{ pkgs, lib, config, ... }: {
    options = {
      gnome.enable =
            lib.mkEnableOption "enables gnome";
    };
    config = lib.mkIf config.gnome.enable {
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
    };
}
