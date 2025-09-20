{ pkgs, lib, ... }: {
  imports = [
    ./hardware/intelGraphics.nix
    ./services/keyring.nix
    ./programs/sway.nix
    ./services/kanshi.nix
    ./services/greeter.nix
  ];
  
  intel.enable =
    lib.mkDefault true;
  sway.enable =
    lib.mkDefault true;
  keyring.enable =
    lib.mkDefault true;
  kanshi.enable = 
    lib.mkDefault true;
  greeter.enable =
    lib.mkDefault true;
}
