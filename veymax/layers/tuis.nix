{ config, pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableBashIntegration = true;
    # if I ever want to make custom channels, do so via [channels](https://nix-community.github.io/home-manager/options.xhtml#opt-programs.television.channels)
  };

  programs.joshuto = {
    enable = true;
    #settings = {
    #  xdg_open = true;
    #  # xdg_open_fork = true; # to continue using joshuto after opening file
    #};
    mimetype = builtins.fromTOML ''
      [mimetype.text]
      app_list = [ { command = "nvim" } ]
    '';
  };

  home.packages = [
    # Dev Tool Tuis
    (pkgs.writeShellScriptBin "jo" ''
      #!/bin/bash
      joshuto
    '')
    pkgs.lazygit # excellent git tui
    (pkgs.writeShellScriptBin "lg" ''
      #!/bin/bash
      lazygit
    '')
    pkgs.lazydocker # docker tui
    pkgs.lazyjournal # tui for journalctl
    pkgs.systemctl-tui # tui for systemd
    pkgs.jqp # rexex cookbook but jq
    pkgs.posting # tui api client

    # Databases
    pkgs.rainfrog # manage databases with a tui

    # System info
    pkgs.neofetch # pretty system information
    pkgs.cpufetch # pretty cpu info
    pkgs.cyme # usb bus info

    # Monitoring
    pkgs.btop # prettier system resources
    pkgs.netop # cool bpf utility to monitor network traffic

    # System admin
    pkgs.pik # interactive process killer
    pkgs.dua # disk usage analyzer

    # Working with files
    pkgs.tdf # terminal pdf viewer

    # Network
    # pkgs.asn # investigate ip addresses # need token

    # ToDo package gocheat in Nix
    # ToDo figure out how to install obsidian.nvim plugin in Nix
    # pkgs.atuin # very cool, sync your shell history across devices, but requires a server to run
  ];
}
