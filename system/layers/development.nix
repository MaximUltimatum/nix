{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    # Optional: add your user to docker group
    enableOnBoot = true;
  };
  users.extraGroups.docker.members = [ "makaison" ];
}