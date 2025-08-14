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
    gcc
    fd
    dogdns
    neovim
    bottom
    walker
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

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "kitty";
      "$runner" = "walker";

      "monitor" = "eDP-1, 1920x1080@60, 0x0, 1";

      exec-once = ''${startupScript}/bin/start'';
      
      general = with config.colorScheme.palette; {
	"col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
	"col.inactive_border" = "rgba(${base00}ff)";
      };

      "$mod" = "SUPER";

      input = {
      	"kb_layout" = "us";
	"follow_mouse" = 1;
	"sensitivity" = 0;
	touchpad = {
		"natural_scroll" = false;
	};
      };

      gestures = {
	"workspace_swipe" = true;
      };

      bindm = [
	# mouse movements
      	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
	"$mod ALT, mouse:272, resize window"
      ];
      bind = [
	"$mod, Q, exec, $terminal" # kitty my beloved
	"$mod, M, exit"
	"$mod, C, killactive"
	"$mod, R, exec, $runner" # walker my beloved
	# focus mods
 	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, J, movefocus, d"
	"$mod, K, movefocus, u"
	# workspace mods vim G [C-A] to count up
	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod, 6, workspace, 6"
	"$mod, 7, workspace, 7"
	"$mod, 8, workspace, 8"
	"$mod, 9, workspace, 9"
	"$mod, 0, workspace, 10"
	# move active window to a workspace with mod + shift
	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod SHIFT, 6, movetoworkspace, 6"
	"$mod SHIFT, 7, movetoworkspace, 7"
	"$mod SHIFT, 8, movetoworkspace, 8"
	"$mod SHIFT, 9, movetoworkspace, 9"
	"$mod SHIFT, 0, movetoworkspace, 10"
      ];
    };
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


