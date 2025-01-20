{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.dissent
    pkgs.discord
    pkgs.asdf-vm # for proton-ge
  ];
}
