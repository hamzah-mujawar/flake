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
    jdt-language-server
    unzip
    zip
    ungoogled-chromium
    cmake
    gnumake
    libtool
    typescript-language-server
    eslint_d
    man-db
    man-pages
    man-pages-posix
    qutebrowser
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.nix-qml-support.packages.${pkgs.stdenv.hostPlatform.system}.tree-sitter-qmljs
    inputs.nix-qml-support.packages.${pkgs.stdenv.hostPlatform.system}.qml-ts-mode
    kdePackages.qtdeclarative
    xwayland-satellite
    ccls
    transmission_4-qt
    mpv
    gdb
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
    fuzzel
    aspellDicts.en
    ripgrep
    nixd
    emacsPackages.jinx
    hunspell
    hunspellDicts.en_GB-ise
    typst
    tinymist
    gcc
    fd
    bottom
    pavucontrol
    brightnessctl
  ];

  programs.nvf = {
    enable = true;

    settings  = {
      vim.theme = {
        enable = true;
        name = "gruvbox";
        transparent = true;
        style = "dark";
      };
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
      vim.options = {
        nu = true;
        relativenumber = true;
      };
      vim.startPlugins = [
        "gruvbox"             
      ];
      vim.telescope = {
        enable = true;
        extensions = [
         {
                name = "fzf";
                packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
                setup = {fzf = {fuzzy = true;};};                
         } 
      ];
        mappings.buffers = "fb";
        mappings.diagnostics = "fld";
        mappings.findFiles = "ff";
        mappings.findProjects = "fp";
        mappings.gitBranches = "fvb";
        mappings.gitBufferCommits = "fvcb";
        mappings.gitCommits = "fvcw";
        mappings.gitFiles = "fvf";
        mappings.gitStash = "fvx";
        mappings.gitStatus = "fvs";
        mappings.helpTags = "fh";
        mappings.liveGrep = "fg";
        mappings.lspDefinitions = "flD";
        mappings.lspDocumentSymbols = "flsb";
        mappings.lspReferences = "flr";
        mappings.lspTypeDefinitions = "flt";
        mappings.lspWorkspaceSymbols = "flsw";
        mappings.open = "ft";
        mappings.resume = "fr";
        mappings.treesitter = "fs";
        setupOpts.defaults.color_devicons = true;

      };
  };
};
  services.mullvad-vpn.enable = true;

  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  
  programs.tmux = {
    enable = true;
    clock24 = true;
  };

  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.nh;

    flake = "/home/pickle/flake";

    clean = {
      enable = true;
      dates = "weekly";
    };
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
