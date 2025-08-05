{ pkgs, lib, ... }: {
  imports = [
    ./services/x11.nix
    ./services/gnome.nix
    ./services/pipewire.nix
    ./services/dwm.nix
  ];
  
  x11.enable =
    lib.mkDefault true;
  gnome.enable =
    lib.mkDefault true;
  pipewire.enable =
    lib.mkDefault true;
  dwm.enable =
    lib.mkDefault true;
}
