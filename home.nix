{ 
  config,
  pkgs,
  #kubectl-flake,
  ... 
}:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./layers/gnome.nix
    ./layers/development.nix
    ./layers/dnd.nix
    ./layers/shell.nix
    ./layers/gaming.nix
    ./layers/audio.nix
  ];

  programs.spotify-player.enable = true;

  services.trayscale.enable = true;

  home.packages = [
    #kubectl-flake.packages.${pkgs.system}.default
    pkgs.yt-dlp
    pkgs.audacity

    pkgs.sl # i like trains
    pkgs.unzip
    pkgs.signal-desktop
    pkgs.element-desktop
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
