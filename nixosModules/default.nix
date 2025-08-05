{ pkgs, lib, ... }: {
  imports = [
    ./services/x11.nix
    ./services/pipewire.nix
    ./programs/hyprland.nix
  ];
  
  x11.enable =
    lib.mkDefault true;
  pipewire.enable =
    lib.mkDefault true;
  hyprland.enable =
    lib.mkDefault true;
}
