{ pkgs, lib, config, ... }: {
    options = {
        gnome.enable =
            lib.mkEnableOption "enables gnome";
    };
    config = lib.mkIf config.gnome.enable {
        # Enable the GNOME Desktop Environment.
        #services.desktopManager.gnome.enable = true;
        services.displayManager.gdm.enable = true;
    };
}
