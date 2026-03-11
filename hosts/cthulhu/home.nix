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

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = with pkgs; [

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
  
  
    programs.git = {
      enable = true;
      userName = "Hamzah Mujawar";
      userEmail = "hamzah1faisal@gmail.com";
    };

    programs.anyrun = {
      enable = true;
      package = inputs.anyrun.packages.${pkgs.stdenv.hostPlatform.system}.anyrun-with-all-plugins;
      config = {
        x = { fraction = 0.5; };
        y = { fraction = 0.3; };
        width = { fraction = 0.3; };
        hideIcons = false;
        ignoreExclusiveZones = false;
        layer = "overlay";
        hidePluginInfo = false;
        closeOnClick = false;
        showResultsImmediately = false;
        maxEntries = null;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/libsymbols.so"
        ];
      };

      # Inline comments are supported for language injection into
      # multi-line strings with Treesitter! (Depends on your editor)
      extraCss = /*css */ ''
        .some_class {
          background: red;
        }
      '';

      extraConfigFiles."some-plugin.ron".text = ''
        Config(
          // for any other plugin
          // this file will be put in ~/.config/anyrun/some-plugin.ron
          // refer to docs of xdg.configFile for available options
        )
      '';
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


