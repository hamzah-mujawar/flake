{ pkgs, lib, config, inputs, ... }:
{
  options = {
    walker.enable =
      lib.mkEnableOption "enables walker";
  };
  config = lib.mkIf config.walker.enable {
    environment.systemPackages = [inputs.walker.packages.${pkgs.stdenv.hostPlatform.system}.default];
    programs.walker = {
      enable = true;
    }
  };
}
