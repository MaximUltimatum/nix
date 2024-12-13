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
        oh-my-zsh = {
            enable = true;
            theme = "refined";
        };
    };

}
