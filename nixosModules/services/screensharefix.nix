{ pkgs, lib, config, ... }: {
  options = {
    screensharefix.enable =
      lib.mkEnableOption "enables screensharefix";
  };
  config = lib.mkIf config.screensharefix.enable {
    # xdg portal + pipewire = screensharing
    xdg.portal = {
      enable = true;
      wlr.enable = true;
    };
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };
}
