{ pkgs, lib, config, ... }: {
    options = {
      qml.enable =
            lib.mkEnableOption "enables qml";
    };
    config = lib.mkIf config.qml.enable {
      programs.tree-sitter-qmljs.enable = true;
      programs.qml-ts-mode.enable = true;
    };
}
