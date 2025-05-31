{ config, pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableBashIntegration = true;
    # if I ever want to make custom channels, do so via [channels](https://nix-community.github.io/home-manager/options.xhtml#opt-programs.television.channels)
  };

  home.packages = [
    pkgs.lazygit # excellent git tui
    (pkgs.writeShellScriptBin "lg" ''
      #!/bin/bash
      lazygit
    '')

    pkgs.vifm # vim file manager

    pkgs.htop # watch your system resources
    pkgs.btop # prettier system resources
    pkgs.neofetch # pretty system information
    pkgs.netop # cool bpf utility to monitor network traffic
  ];
}
