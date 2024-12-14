{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.dissent
  ];
}
