{ config, pkgs, ... }:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ./omarchy/omarchy.nix
  ];


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
