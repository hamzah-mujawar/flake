{ pkgs, lib, config, ... }: {
    options = {
      qemu.enable =
            lib.mkEnableOption "enables qemu";
    };
    config = lib.mkIf config.qemu.enable {
      environment.systemPackages = [
	pkgs.qemu
	pkgs.quickemu
      ];
    };
}
