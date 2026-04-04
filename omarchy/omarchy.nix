{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    #feishin
  ];

  home.file.".config/hypr/bindings.conf" = {
    text = ''
      # EXISTING OMARCHY CONFIG
      bindd = SUPER ALT, RETURN, Tmux, exec, uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new
      # Application bindings
      $terminal = uwsm-app -- xdg-terminal-exec
      $browser = omarchy-launch-browser
      
      bindd = SUPER, RETURN, Terminal, exec, $terminal --working-directory="$(omarchy-cmd-terminal-cwd)"
      bindd = SUPER SHIFT, RETURN, Browser, exec, omarchy-launch-browser
      bindd = SUPER SHIFT, F, File manager, exec, uwsm-app -- nautilus --new-window
      bindd = SUPER ALT SHIFT, F, File manager (cwd), exec, uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"
      bindd = SUPER SHIFT, N, Editor, exec, omarchy-launch-editor
      
      # If your web app url contains #, type it as ## to prevent hyprland treating it as a comment
      bindd = SUPER SHIFT CTRL, G, Google Messages, exec, omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations" # TODO setup
      
      # Tweaked
      bindd = SUPER SHIFT, X, ChatGPT, exec, omarchy-launch-webapp "https://claude.ai" # TODO opencode
      bindd = SUPER SHIFT, SLASH, Passwords, exec, uwsm-app -- bitwarden-desktop
      bindd = SUPER SHIFT, D, Discord, exec, vesktop
      bindd = SUPER SHIFT, T, Tasks, exec, omarchy-launch-or-focus-webapp "Vikunja" "https://tasks.maximstroud.de"
      bindd = SUPER SHIFT, A, Activity, exec, $terminal -e btop
      bindd = SUPER SHIFT, I, Immich, exec, omarchy-launch-or-focus-webapp "Immich" "https://photos.maximstroud.de/"
      bindd = SUPER SHIFT, S, Signal, exec, omarchy-launch-or-focus signal "uwsm-app -- signal-desktop"
      bindd = SUPER SHIFT, C, Calendar, exec, omarchy-launch-webapp "https://calendar.proton.me/"
      bindd = SUPER SHIFT, V, Jellyfin, exec, omarchy-launch-webapp "https://videos.kingfisher-halfmoon.ts.net/"
      bindd = SUPER SHIFT, E, Email, exec, omarchy-launch-webapp "https://mail.proton.me/"
      bindd = SUPER SHIFT, R, Recipes, exec, omarchy-launch-webapp "https://recipes.maximstroud.de/"
      bindd = SUPER SHIFT, M, Music, exec, omarchy-launch-or-focus spotify-launcher
      
      # MY EDITS:
      unbind = SUPER, K
      unbind = SUPER, J
      unbind = SUPER, O
      unbind = SUPER, L
      unbind = SUPER, Y
      bindd = SUPER, U, Show key bindings, exec, omarchy-menu-keybindings
      bindd = SUPER, Y, Toggle vertical/horizaontal split, togglesplit
      bindd = SUPER SHIFT, O, Obsidian, exec, omarchy-launch-or-focus "^obsidian$" "uwsm-app -- obsidian -disable-gpu --enable-wayland-ime"
      
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
      
      # For nvidia card
      env = LIBVA_DRIVER_NAME,nvidia
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = WLR_NO_HARDWARE_CURSORS,1
    '';
    onChange = ''
      hyprctl reload
    '';
  };
}
