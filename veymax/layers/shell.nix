{ config, pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        enableVteIntegration = true;
        autocd = true;
        autosuggestion.enable = true;
        history = {
            #append = true;
            expireDuplicatesFirst = true;
            ignoreAllDups = true;
        };
        envExtra = "bindkey '^ ' autosuggest-accept";
        oh-my-zsh = {
            enable = true;
            theme = "refined";
        };
    };
  home.packages = [
    pkgs.tmate
    pkgs.just
  ];
}
