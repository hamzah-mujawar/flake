{ pkgs, lib, config, ... }: {
  options = {
    fish.enable =
      lib.mkEnableOption "enables fish";
  };
  config = lib.mkIf config.fish.enable {
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
        set fish_greeting # Disable greeting
        '';
    };
    environment.systemPackages = with pkgs; [
        fishPlugins.done
        fishPlugins.fzf-fish
        fishPlugins.grc
     ];
  };
}

