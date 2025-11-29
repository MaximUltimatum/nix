{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    sl # i like trains
    cbonsai # inner peace through ascii
    nms #sneakers decryption
    cmatrix # terminal screensaver
    wl-clipboard # for tmux copying
    tmux # need
    jrnl #thoughts
    usbimager # image usbs
  ];

  home.file = {
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
