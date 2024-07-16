{ config, pkgs, ... }:

{
  home.username = "veymax";
  home.homeDirectory = "/home/veymax";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [
    ./layers/gnome.nix
    ./layers/development.nix
  ];

  home.packages = [
    # DnD
    pkgs.google-chrome
    pkgs.obsidian
    pkgs.zoom-us

    pkgs.sl # i like trains
  ];

  home.file = {
    # See https://github.com/JetBrains/ideavim/wiki/NERDTree-support
    ".ideavimrc".text = ''
      Plug 'preservim/nerdtree'
      map <C-f> :NERDTreeFocus<CR>
      set clipboard+=unnamedplus
    '';
  };

  # Add to bashrc if home-manager isn't managing shell:
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    # Zoom is awful to configure
    QT_XCB_GL_INTEGRATION = "none";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
