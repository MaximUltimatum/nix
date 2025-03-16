# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./default/default-configuration.nix
      ./default/hardware-configuration.nix
      ./layers/development.nix
      ./layers/office.nix
      ./layers/systemshell.nix
      #./layers/starcitizen-flake.nix
      ./layers/enable-flakes.nix
      <home-manager/nixos>
    ];
  
  home-manager.users.veymax = { pkgs, ... }: {
    home.stateVersion = "24.11";
    imports = [ ../veymax/home.nix ];
  };

  # For printing
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
