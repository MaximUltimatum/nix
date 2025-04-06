{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  users.extraGroups.docker.members = [ "veymax" ]; # Changed from makaison to veymax
  environment.systemPackages = [ # or home.packages
    pkgs.jetbrains-toolbox
    pkgs.rpi-imager
  ];
}
