{ config, pkgs, ... }:
{
  environment.systemPackages = [ # or home.packages
    pkgs.libreoffice

    pkgs.nextcloud-client # todo move this somewhere where it makes more sense
  ];
}
