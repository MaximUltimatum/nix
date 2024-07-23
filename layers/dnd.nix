{ config, pkgs, ... }:
{
  home.packages = [
    # DnD
    pkgs.google-chrome
    pkgs.obsidian
    pkgs.zoom-us
    pkgs.nextcloud-client
  ];
  
  # Add to bashrc if home-manager isn't managing shell:
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    # Zoom is awful to configure
    QT_XCB_GL_INTEGRATION = "none";
  };
}
