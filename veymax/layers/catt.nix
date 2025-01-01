{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.catt
  ];

  home.file = {
    # See https://github.com/JetBrains/ideavim/wiki/NERDTree-support
    ".config/catt/catt.cfg".text = ''
      [options]
      device = lgcast
      
      [aliases]
      lgcast = 192.168.3.39
    '';
  };
}
