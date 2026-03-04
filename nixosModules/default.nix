{ pkgs, lib, ... }: {
  imports = [
    ./hardware/intelGraphics.nix
    ./services/keyring.nix
    ./programs/niri.nix
    ./services/kanshi.nix
    ./services/greeter.nix
    ./services/screensharefix.nix
    ./programs/qemu.nix
    ./programs/fish.nix
    ./programs/steam.nix
    ./programs/emacs.nix
  ];
  
  intel.enable =
    lib.mkDefault true;
  niri.enable =
    lib.mkDefault true;
  keyring.enable =
    lib.mkDefault true;
  kanshi.enable = 
    lib.mkDefault true;
  greeter.enable =
    lib.mkDefault true;
  screensharefix.enable =
    lib.mkDefault true;
  qemu.enable =
    lib.mkDefault true;
  fish.enable =
    lib.mkDefault true;
  steam.enable =
    lib.mkDefault true;
  emacs.enable =
    lib.mkDefault true;
}
