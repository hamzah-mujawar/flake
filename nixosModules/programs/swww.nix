{ pkgs, lib, config, ... }: {
    options = {
      swww.enable =
            lib.mkEnableOption "enables swww";
    };
    config = lib.mkIf config.swww.enable {
      programs.swww.enable = true;
    };
}
