{ 
  config,
  pkgs,
  #kubectl-flake,
  ...
}:

{
  home.username = "root";
  home.homeDirectory = "/root";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./layers/development.nix
    ./layers/terminal.nix
    ./layers/audio.nix
    ./layers/catt.nix
    ./layers/tuis.nix
  ];

  programs.spotify-player.enable = true;

  home.packages = [
    #kubectl-flake.packages.${pkgs.system}.default
    #pkgs.vesktop
    #pkgs.mumble
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
