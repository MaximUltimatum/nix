{ config, pkgs, inputs, ... }: 
{
  # NOTE - this may be worth trying on NixOS, but the experience is difficult to work with on non-nixos. Use the LUG-helper instead
  # NixOS configuration for Star Citizen requirements
  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };
  # configuration.nix
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
  environment.systemPackages = [ # or home.packages
      inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.star-citizen
  ];
}
