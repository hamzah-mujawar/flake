{ inputs, pkgs, lib, config, ... }: {
    options = {
        hyprland.enable =
            lib.mkEnableOption "enables hyprland";
    };
    config = lib.mkIf config.hyprland.enable {
      inputs.hyprland = {
	enable = true;
	package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
	portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      };
    };
}
 
