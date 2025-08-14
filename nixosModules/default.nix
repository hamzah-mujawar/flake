{ pkgs, lib, ... }: {
  imports = [
    ./services/x11.nix
    ./services/pipewire.nix
    ./programs/hyprland.nix
    ./hardware/intelGraphics.nix
    ./programs/walker.nix
  ];
  intel.enable =
    lib.mkDefault true;
  x11.enable =
    lib.mkDefault true;
  pipewire.enable =
    lib.mkDefault true;
  hyprland.enable =
    lib.mkDefault true;
  walker.enable = 
    lib.mkDefault true;
}
