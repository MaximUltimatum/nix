{ 
  config,
  pkgs,
  #kubectl-flake,
  ... 
}:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./layers/gnome.nix
    ./layers/development.nix
    ./layers/dnd.nix
    ./layers/shell.nix
    ./layers/gaming.nix
    ./layers/audio.nix
    ./layers/catt.nix
    ./layers/chat.nix
    #./layers/starcitizen-flake.nix
  ];

  programs.spotify-player.enable = true;

  home.packages = [
    #kubectl-flake.packages.${pkgs.system}.default
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
