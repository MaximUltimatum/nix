{ config, pkgs, ... }:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ./omarchy/omarchy.nix
    ./development/dev.nix
    ./development/terminal.nix
    ./omarchy/jrnl.nix
  ];
  
  home.packages = with pkgs; [
    (writeShellScriptBin "hms" ''
      home-manager switch $@
    '')
  ];


  home.sessionVariables = {
    EDITOR = "nvim";
  };
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
