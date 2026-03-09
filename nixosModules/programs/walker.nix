{ pkgs, lib, config, inputs, ... }:
{
  options = {
    walker.enable =
      lib.mkEnableOption "enables walker";
  };
  config = lib.mkIf config.walker.enable {
    programs.walker = {
      enable = true;
      package = inputs.walker.packages.${pkgs.stdenv.hostPlatform.system}.default;      
      runAsService = true;
    };
  };
}
