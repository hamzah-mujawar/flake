{ pkgs, lib, config, ... }: {
  options = {
    helix.enable =
      lib.mkEnableOption "enables helix";
  };
  config = lib.mkIf config.helix.enable {
    environment.systemPackages = with pkgs; [
      helix
    ];
  };
}
