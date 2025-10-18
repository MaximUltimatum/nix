{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.catt
  ];

  home.file = {
    ".config/catt/catt.cfg".text = ''
      [options]
      device = lgcast
      
      [aliases]
      lgcast = 192.168.3.39
    '';
  };
}
