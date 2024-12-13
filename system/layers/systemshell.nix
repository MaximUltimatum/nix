{ config, pkgs, ... }:
{
      programs.zsh.enable = true;
      users.defaultUserShell = pkgs.zsh;
      environment.pathsToLink = [ "/share/zsh" ]; # Allows zsh completion for system packages
}
