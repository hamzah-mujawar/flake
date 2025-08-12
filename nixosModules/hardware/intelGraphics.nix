{ pkgs, lib, config, ... }: {
  options = {
    intel.enable =
      lib.mkEnableOption "enables intel";
  };
  config = lib.mkIf config.intel.enable {
    boot.kernelModules = ["i915"];
    hardware = {
      enableRedistributableFirmware = true;
      graphics = {
	extraPackages = with pkgs; [
	  intel-media-driver
	  intel-ocl
	  intel-vaapi-driver
	  ocl-icd
	  intel-graphics-compiler
	  intel-compute-runtime
	];
      };
    };
  };
}
