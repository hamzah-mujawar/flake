{ pkgs, lib, config, ... }: {
  options = {
    keyring.enable =
      lib.mkEnableOption "enables keyring";
  };
  config = lib.mkIf config.keyring.enable {
    services.gnome.gnome-keyring.enable = true; 
  };
}
