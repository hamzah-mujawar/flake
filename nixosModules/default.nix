{ pkgs, lib, ... }: {
  imports = [
    ./services/x11.nix
    ./services/pipewire.nix
    ./services/gnome.nix
    ./hardware/intelGraphics.nix
  ];
  intel.enable =
    lib.mkDefault true;
  x11.enable =
    lib.mkDefault true;
  pipewire.enable =
    lib.mkDefault true;
  gnome.enable =
    lib.mkDefault true;
}
