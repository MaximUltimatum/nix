{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.minio-client
  ];
}
