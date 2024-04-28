{ config, pkgs, ... }:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "23.11"; # Please read the comment before changing.

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
    extraConfig = ''set tabstop=2 expandtab shiftwidth=2 nocompatible'';
  };

  programs.git = {
    enable = true;
    signing.signByDefault = true;
    signing.key = "29E74C433268C88E";
    userEmail = "mcder018@live.com";
    userName = "MaximUltimatum";
  };

  dconf.settings = {
    "org/gnome/shell/extensions/ding" = {
      show-home = false;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Yaru-sage-dark";
      icon-theme = "Yaru-sage";
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
    pkgs.gh
    pkgs.tailscale
    pkgs.gnome.gnome-tweaks
    pkgs.sl
    pkgs.gnomeExtensions.openweather
    pkgs.gnomeExtensions.vitals
    pkgs.gnomeExtensions.dash-to-dock

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

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
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
