{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.signal-desktop
    pkgs.element-desktop
  ];
}
