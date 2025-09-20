{ pkgs, lib, ... }: {
  imports = [
    ./hardware/intelGraphics.nix
    ./services/keyring.nix
    ./programs/sway.nix
    ./services/kanshi.nix
  ];
  
  intel.enable =
    lib.mkDefault true;
  sway.enable =
    lib.mkDefault true;
  keyring.enable =
    lib.mkDefault true;
  kanshi.enable = 
    lib.mkDefault true;
}
