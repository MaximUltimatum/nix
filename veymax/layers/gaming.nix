{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.dissent
    pkgs.discord
  ];
}
