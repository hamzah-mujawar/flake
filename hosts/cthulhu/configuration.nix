{ config, pkgs, inputs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "cthulhu"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pickle = {
    isNormalUser = true;
    description = "pickle";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  tree-sitter-parsers = grammars: with grammars; [
    tree-sitter-bash
    tree-sitter-c
    tree-sitter-c-sharp
    tree-sitter-cmake
    tree-sitter-cpp
    tree-sitter-css
    tree-sitter-dot
    tree-sitter-elisp
    tree-sitter-glsl
    tree-sitter-haskell
    tree-sitter-html
    tree-sitter-java
    tree-sitter-javascript
    tree-sitter-json
    tree-sitter-json5
    tree-sitter-kotlin
    tree-sitter-latex
    tree-sitter-llvm
    tree-sitter-lua
    tree-sitter-make
    tree-sitter-markdown
    tree-sitter-markdown-inline
    tree-sitter-nickel
    tree-sitter-nix
    tree-sitter-prisma
    tree-sitter-python
    inputs.nix-qml-support.packages.${pkgs.stdenv.system}.tree-sitter-qmljs
    tree-sitter-regex
    tree-sitter-rust
    tree-sitter-scss
    tree-sitter-sql
    tree-sitter-toml
    tree-sitter-tsx
    tree-sitter-typescript
    tree-sitter-vim
    tree-sitter-yaml
    tree-sitter-zig
  ];


  environment.systemPackages = with pkgs; [
    usbutils
    pciutils
    fastfetch
    clinfo
    grim
    slurp
    wl-clipboard
    mako
    satty
    nodejs_24
    pavucontrol
    vesktop
    flyctl
    jdk
    global
    jdt-language-server
    unzip
    zip
    ungoogled-chromium
    cmake
    gnumake
    libtool
    typescript-language-server
    ((emacsPackagesFor emacs-pgtk).emacsWithPackages (
      epkgs: [epkgs.vterm epkgs.treesit-grammars.with-all-grammars inputs.nix-qml-support.packages.${pkgs.stdenv.hostPlatform.system}.qml-ts-mode ]
    ))
    eslint_d
    man-db
    man-pages
    man-pages-posix
    qutebrowser
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.nix-qml-support.packages.${pkgs.stdenv.hostPlatform.system}.tree-sitter-qmljs
    inputs.nix-qml-support.packages.${pkgs.stdenv.hostPlatform.system}.qml-ts-mode

  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
  };

  # Make laptop lid lock only
  services.logind.lidSwitch = "lock";
  services.logind.lidSwitchExternalPower = "lock";
  services.logind.lidSwitchDocked = "ignore";

  
  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Make emacs the default text EDITOR
  environment.variables = {
    EDITOR = "emacs";
    VISUAL = "emacs";
    SUDO_EDITOR = "emacs";
  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
