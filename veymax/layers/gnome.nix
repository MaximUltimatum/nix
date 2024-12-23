{ config, pkgs, ... }:
{
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
      gtk-theme = "Adwaita";
      icon-theme = "Adwaita";
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

  home.packages = [
    pkgs.gnome.gnome-tweaks
    pkgs.gnome-extension-manager
    pkgs.gnomeExtensions.wallpaper-slideshow

    pkgs.gnomeExtensions.vitals
    pkgs.gnomeExtensions.dash-to-dock
  ];
}
