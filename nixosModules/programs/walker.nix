{ pkgs, lib, config, ... }: {
    options = {
      walker.enable =
            lib.mkEnableOption "enables walker";
    };
    config = lib.mkIf config.walker.enable {
      programs.walker.enable = true;
    };
}
