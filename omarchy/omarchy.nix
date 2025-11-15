{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/bindings.conf" = {
    text = ''
      # EXISTING OMARCHY CONFIG
      # Application bindings
      $terminal = uwsm-app -- xdg-terminal-exec
      $browser = omarchy-launch-browser

      bindd = SUPER, RETURN, Terminal, exec, $terminal --working-directory="$(omarchy-cmd-terminal-cwd)"
      bindd = SUPER SHIFT, F, File manager, exec, uwsm-app -- nautilus --new-window
      bindd = SUPER SHIFT, B, Browser, exec, $browser
      bindd = SUPER SHIFT ALT, B, Browser (private), exec, $browser --private
      bindd = SUPER SHIFT, M, Music, exec, omarchy-launch-or-focus spotify
      bindd = SUPER SHIFT, N, Editor, exec, omarchy-launch-editor
      bindd = SUPER SHIFT, T, Activity, exec, $terminal -e btop
      bindd = SUPER SHIFT, D, Docker, exec, $terminal -e lazydocker
      bindd = SUPER SHIFT, G, Signal, exec, omarchy-launch-or-focus signal "uwsm-app -- signal-desktop"
      bindd = SUPER SHIFT, O, Obsidian, exec, omarchy-launch-or-focus "^obsidian$" "uwsm-app -- obsidian -disable-gpu --enable-wayland-ime"
      bindd = SUPER SHIFT, W, Typora, exec, uwsm-app -- typora --enable-wayland-ime
      bindd = SUPER SHIFT, SLASH, Passwords, exec, uwsm-app -- bitwarden-desktop # modified from 1password

      # If your web app url contains #, type it as ## to prevent hyprland treating it as a comment
      bindd = SUPER SHIFT, A, ChatGPT, exec, omarchy-launch-webapp "https://chatgpt.com" # TODO opencode
      bindd = SUPER SHIFT, C, Calendar, exec, omarchy-launch-webapp "https://app.hey.com/calendar/weeks/" # TODO proton calendar
      bindd = SUPER SHIFT, E, Email, exec, omarchy-launch-webapp "https://app.hey.com" # TODO protonmail
      bindd = SUPER SHIFT, Y, YouTube, exec, omarchy-launch-webapp "https://youtube.com/" # TODO Jellyfin
      bindd = SUPER SHIFT CTRL, G, Google Messages, exec, omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations" # TODO setup
      bindd = SUPER SHIFT, P, Google Photos, exec, omarchy-launch-or-focus-webapp "Google Photos" "https://photos.google.com/" # TODO immich
      bindd = SUPER SHIFT, X, X, exec, omarchy-launch-webapp "https://x.com/" # TODO discord

      # Overwrite existing bindings, like putting Omarchy Menu on Super + Space
      # unbind = SUPER, SPACE
      # bindd = SUPER, SPACE, Omarchy menu, exec, omarchy-menu
      unbind = SUPER, K
      unbind = SUPER, J

      # MY EDITS:

      # Vim-like window navigation (replacing arrow keys)
      bind = SUPER, h, movefocus, l
      bind = SUPER, j, movefocus, d
      bind = SUPER, k, movefocus, u
      bind = SUPER, l, movefocus, r

      # Move windows with vim keys
      bind = SUPER SHIFT, h, movewindow, l
      bind = SUPER SHIFT, j, movewindow, d
      bind = SUPER SHIFT, k, movewindow, u
      bind = SUPER SHIFT, l, movewindow, r

      # Resize windows with vim keys
      bind = SUPER CTRL, h, resizeactive, -40 0
      bind = SUPER CTRL, j, resizeactive, 0 40
      bind = SUPER CTRL, k, resizeactive, 0 -40
      bind = SUPER CTRL, l, resizeactive, 40 0
    '';
    onChange = ''
      hyperctl reload
    '';
  };

  home.file.".config/hypr/input.conf" = {
    text = ''
      # Control your input devices
      # See https://wiki.hypr.land/Configuring/Variables/#input
      input {
        # Use multiple keyboard layouts and switch between them with Left Alt + Right Alt
        # kb_layout = us,dk,eu
        kb_layout = us
        kb_options = compose:caps # ,grp:shifts_toggle

        # Change speed of keyboard repeat
        repeat_rate = 40
        repeat_delay = 600

        # Start with numlock on by default
        numlock_by_default = true

        # Increase sensitivity for mouse/trackpad (default: 0)
        # sensitivity = 0.35

        touchpad {
          # Use natural (inverse) scrolling
          # natural_scroll = true

          # Use two-finger clicks for right-click instead of lower-right corner
          # clickfinger_behavior = true

          # Control the speed of your scrolling
          scroll_factor = 0.4
        }
      }

      # Scroll nicely in the terminal
      windowrule = scrolltouchpad 1.5, class:(Alacritty|kitty)
      windowrule = scrolltouchpad 0.2, class:com.mitchellh.ghostty

      # Enable touchpad gestures for changing workspaces
      # See https://wiki.hyprland.org/Configuring/Gestures/
      # gesture = 3, horizontal, workspace
      input {
        kb_options = compose:caps,altwin:swap_alt_win
      }
    '';
    onChange = ''
      hyperctl reload
    '';
  };
}
