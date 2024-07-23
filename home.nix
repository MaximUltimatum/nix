{ config, pkgs, ... }:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./layers/gnome.nix
    ./layers/development.nix
    ./layers/dnd.nix
  ];

  home.packages = [
    pkgs.sl # i like trains
    pkgs.signal-desktop
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
