{ config, pkgs, ... }:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  programs.neovim = {
    enable = true;
    coc.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''set tabstop=2 expandtab shiftwidth=2 nocompatible clipboard+=unnamedplus'';
  };

  # Configure git diffs, signing, and ignores
  programs.git = {
    enable = true;
    ignores = [
      "*.swp"
      "*~"
    ];
    hooks = {}; # we should add a code formatter later
    # It is safe to commit the KEY ID to git. Just not the private key
    # signing.key = "";
    signing.signByDefault = true;
    signing.key = "1DE0258EDEA3687C02B410000E5996F02A636F3E";
    userEmail = "mcder018@live.com";
    userName = "MaximUltimatum";
    difftastic.enable = true;
    difftastic.background = "dark";
    difftastic.display = "inline";
    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };

  # If you make changes to this, remember to run `pkill gpg-agent` after your reload your config
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 34560000;
    pinentryPackage = pkgs.pinentry-curses;
  };


  # run: `dconf watch /` to find these
  dconf.settings = {
    "org/gnome/desktop/sound" = {
      event-sounds = false;
    };
    "org/gnome/mutter" = {
      workspaces-only-on-primary = false;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Yaru-sage-dark";
      icon-theme = "Yaru-sage";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "fingers";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      ambient-enabled = false;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/shell/extensions/ding" = {
      show-home = false;
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      show-mounts = false;
      show-trash = false;
      dash-max-icon-size = 24;
      show-show-apps-button = false;
      favorite-apps = [];
    };
    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [
        "_memory_usage_"
        "_system_load_1m_"
        "__network-rx_max__"
        "__temperature_avg__"
      ];
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # DnD
    pkgs.google-chrome
    pkgs.obsidian
    # pkgs.nextcloud-client

    # development
    pkgs.gh
    pkgs.xclip
    pkgs.jetbrains-toolbox

    # customization
    pkgs.gnome.gnome-tweaks
    pkgs.sl
    pkgs.gnome-extension-manager

    # Version is too new
    # pkgs.gnomeExtensions.openweather
    # pkgs.gnomeExtensions.vitals
    # pkgs.gnomeExtensions.dash-to-dock

    (pkgs.writeShellScriptBin "fix-pinentry" ''
      pkill -f gpg-agent; pkill -f pinentry
      systemctl --user restart gpg-agent{.socket,-extra.socket,-ssh.socket}
    '')
  ];

  home.file = {
    # See https://github.com/JetBrains/ideavim/wiki/NERDTree-support
    ".ideavimrc".text = ''
      Plug 'preservim/nerdtree'
      map <C-f> :NERDTreeFocus<CR>
    '';

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/veymax/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
