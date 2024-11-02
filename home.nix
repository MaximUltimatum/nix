{ config, pkgs, ... }:


{
  home.username = "makaison";
  home.homeDirectory = "/home/makaison";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./layers/gnome.nix
    ./layers/development.nix
    ./layers/dnd.nix
  ];

  programs.spotify-player.enable = true;

  home.packages = [
    pkgs.sl # i like trains
    pkgs.unzip
    pkgs.signal-desktop
    pkgs.super-productivity
    pkgs.spotify
    pkgs.element-desktop
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
