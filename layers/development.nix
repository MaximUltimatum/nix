{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    coc.enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''set tabstop=2 expandtab shiftwidth=2 nocompatible clipboard+=unnamedplus'';
  };

  # Configure git diffs, signing, and ignores
  programs.git = {
    enable = true;
    ignores = [
      "*.swp"
      "*~"
    ];
    hooks = {}; # we should add a code formatter later
    # It is safe to commit the KEY ID to git. Just not the private key
    # signing.signByDefault = true;
    # signing.key = "142DB6DC193A51B4864C897629E74C433268C88E";
    userEmail = "mcder018@live.com";
    userName = "MaximUltimatum";
    difftastic.enable = true;
    difftastic.background = "dark";
    difftastic.display = "inline";
    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };

  # If you make changes to this, remember to run `pkill gpg-agent` after your reload your config
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 34560000;
    pinentryPackage = pkgs.pinentry-curses;
  };

  home.packages = [
    pkgs.gh
    pkgs.xclip
    pkgs.jetbrains-toolbox
    pkgs.kubectl
    pkgs.kubectx
    pkgs.kubeseal
    pkgs.argocd
    pkgs.jq
    
    (pkgs.writeShellScriptBin "fix-pinentry" ''
      pkill -f gpg-agent; pkill -f pinentry
      systemctl --user restart gpg-agent{.socket,-extra.socket,-ssh.socket}
    '')
    (pkgs.writeShellScriptBin "minio-login" ''
      kubectl get secret/console-sa-secret -n backups -o json | jq -r ".data.token" | base64 -d
    '')
  ];

  home.file = {
    # See https://github.com/JetBrains/ideavim/wiki/NERDTree-support
    ".ideavimrc".text = ''
      Plug 'preservim/nerdtree'
      map <C-f> :NERDTreeFocus<CR>
      set clipboard+=unnamedplus
    '';
  };

}
