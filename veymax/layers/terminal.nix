{ config, pkgs, ... }:

{
  # NOTE: Remember to add the following to the end of your bashrc
  # eval -- "$(/home/milien/.nix-profile/bin/starship init bash --print-full-init)"
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.wallust.enable = true;
  # doesn't work on non-Nixos systems, install manually and use the config below
  programs.alacritty.enable = true;

  home.packages = with pkgs; [
    sl # i like trains
    cbonsai # inner peace through ascii
    nms #sneakers decryption
    cmatrix # terminal screensaver
    wl-clipboard # for tmux copying
    tmux

    (writeShellScriptBin "colors" ''
      wallust run "$(gsettings get org.gnome.desktop.background picture-uri | sed "s/^'file:\/\///" | sed "s/'$//")" --palette ansidark
    '')
  ];

  home.file = {
    ".alacritty.toml".text = ''
        [font]
        size = 14.0
        [keyboard]
        bindings = [{ key = "Space", mods = "Control", mode = "~Search", action = "ToggleViMode" }]

        [window]
        decorations = "none"
        dynamic_padding = true
        opacity = 0.9
        dynamic_title = true
    '';
    ".tmux.conf".text = ''
        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
        bind-key p run "wl-paste | tmux load-buffer - ; tmux paste-buffer"
        bind h select-pane -L  # move left
        bind j select-pane -D  # move down
        bind k select-pane -U  # move up
        bind l select-pane -R  # move right
        set -g status-bg default
        set -g status-style bg=default
    '';
  };
}
