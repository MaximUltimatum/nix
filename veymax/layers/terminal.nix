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

  home.packages = [
    pkgs.sl # i like trains
    pkgs.cbonsai # inner peace through ascii
    pkgs.nms #sneakers decryption
    pkgs.cmatrix

    (pkgs.writeShellScriptBin "colors" ''
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
        bind h select-pane -L  # move left
        bind j select-pane -D  # move down
        bind k select-pane -U  # move up
        bind l select-pane -R  # move right
    '';
  };
}
