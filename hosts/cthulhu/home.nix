{ inputs, config, pkgs, ... }:
{
  # Imports
  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.nix-colors.homeManagerModules.default
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pickle";
  home.homeDirectory = "/home/pickle";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
    ];
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    aspellDicts.en
    nerd-fonts.caskaydia-mono
    gnome-themes-extra
    ripgrep
    nixd
    emacsPackages.jinx
    hunspell
    hunspellDicts.en_GB-ise
    zotero
    typst
    tinymist
    obsidian
    wl-clipboard
    libgcc
    gcc
    wl-screenrec
    fd
    dogdns
    neovim
    steam
    bottom
  ];
  
  fonts.fontconfig.enable = true;
  programs.direnv.enable = true;
  
  # Nix Colors
  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    
  };

  programs.zen-browser.enable = true;
  
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
  };
  
  programs.git = {
    enable = true;
    userName = "Hamzah Mujawar";
    userEmail = "hamzah1faisal@gmail.com";
  };
  
  programs.kitty = {
    enable = true;
    settings = {
      active_tab_foreground = "#${config.colorScheme.palette.base00}";
      active_tab_background = "#${config.colorScheme.palette.base0D}";

      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      url_color = "#${config.colorScheme.palette.base0E}";
      # terminal8
      color0 = "#${config.colorScheme.palette.base00}"; # black
      color1 = "#${config.colorScheme.palette.base08}"; # red
      color2 = "#${config.colorScheme.palette.base0B}"; # green
      color3 = "#${config.colorScheme.palette.base0A}"; # yellow
      color4 = "#${config.colorScheme.palette.base0D}"; # blue
      color5 = "#${config.colorScheme.palette.base0E}"; # magenta
      color6 = "#${config.colorScheme.palette.base0C}"; # cyan
      color7 = "#${config.colorScheme.palette.base05}"; # white
      # terminal16
      color8 = "#${config.colorScheme.palette.base03}"; # bright black
      color9 = "#${config.colorScheme.palette.base08}"; # bright red
      color10 = "#${config.colorScheme.palette.base0B}"; # bright green
      color11 = "#${config.colorScheme.palette.base0A}"; # bright yellow
      color12 = "#${config.colorScheme.palette.base0D}"; # bright blue
      color13 = "#${config.colorScheme.palette.base0E}"; # bright magenta
      color14 = "#${config.colorScheme.palette.base0C}"; # bright cyan
      color15 = "#${config.colorScheme.palette.base07}"; # bright white

      repaint_delay = "60";
      sync_to_monitor = "yes";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      font_family = "CaskaydiaMono NF";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = "16.0";
      cursor_shape = "beam";
      cursor_beam_thickness = "0.5";
      cursor_blink_interval = "0.5";
      strip_trailing_spaces = "always";
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      background_opacity = "0.8";
      background_blur = 5;
      update_check_interval = "0";
    };
  };
  
  home.sessionVariables = {

  };

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
} 


# I'm kinda ill today so i'm taking today slow, gonna chill with some zachtronics or smth like that
