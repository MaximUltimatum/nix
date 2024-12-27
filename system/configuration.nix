# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./default/default-configuration.nix
      ./default/hardware-configuration.nix
      ./layers/development.nix
      ./layers/systemshell.nix
      ./layers/starcitizen.nix
      <home-manager/nixos>
    ];
  
  home-manager.users.veymax = { pkgs, ... }: {
    home.stateVersion = "24.11";
    imports = [ ../veymax/home.nix ];
  };
}
