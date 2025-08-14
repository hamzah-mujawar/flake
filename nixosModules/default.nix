{ pkgs, lib, ... }: {
  imports = [
    ./services/x11.nix
    ./services/pipewire.nix
    ./programs/hyprland.nix
    ./hardware/intelGraphics.nix
  ];
  intel.enable =
    lib.mkDefault true;
  x11.enable =
    lib.mkDefault true;
  pipewire.enable =
    lib.mkDefault true;
  hyprland.enable =
    lib.mkDefault true;
}
