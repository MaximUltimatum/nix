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

  home.packages = with pkgs; [
    # Dev Tool Tuis
    (writeShellScriptBin "jo" ''
      #!/bin/bash
      joshuto
    '')
    lazygit # excellent git tui
    (writeShellScriptBin "lg" ''
      #!/bin/bash
      lazygit
    '')
    lazydocker # docker tui
    lazyjournal # tui for journalctl
    systemctl-tui # tui for systemd
    jqp # rexex cookbook but jq
    posting # tui api client

    # Databases
    rainfrog # manage databases with a tui

    # System info
    neofetch # pretty system information
    cpufetch # pretty cpu info
    cyme # usb bus info

    # Monitoring
    btop # prettier system resources
    netop # cool bpf utility to monitor network traffic

    # System admin
    pik # interactive process killer
    dua # disk usage analyzer

    # Working with files
    tdf # terminal pdf viewer

    # Network
    # pkgs.asn # investigate ip addresses # need token

    # ToDo package gocheat in Nix
    # ToDo figure out how to install obsidian.nvim plugin in Nix
    # pkgs.atuin # very cool, sync your shell history across devices, but requires a server to run
  ];
}
