{ pkgs, lib, config, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in {
  options = {
    walker.enable =
      lib.mkEnableOption "enables walker";
  };
  config = lib.mkIf config.walker.enable {
    environment.systemPackages = [
      inputs.walker.packages.${system}.default
    ];
  };
}

