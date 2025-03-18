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
    signing.signByDefault = true;
    signing.key = "D3AFB8819B14AEBC5125DAB472008A345C7958C1";
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

  programs.kubecolor = {
    enable = true;
    enableAlias = true;
  };

  home.packages = [
    pkgs.gh
    pkgs.gnupg
    pkgs.xclip

    # pkgs.jetbrains-toolbox # this is fucky on standalone non-nixos
    pkgs.zed-editor

    # k8s
    pkgs.kubectl
    pkgs.kubectx
    pkgs.kubectl-view-secret
    pkgs.k9s
    pkgs.kubeseal
    pkgs.argocd
    pkgs.jq

    # random languages I work with
    pkgs.nodejs_22
    pkgs.go
    pkgs.python3

    # lifesaver and really cool
    pkgs.tmate
   
    # And run `export GPG_TTY=$(tty)` or figure out how to add this to the end of the .bashrc file
    (pkgs.writeShellScriptBin "fix-pinentry" ''
      pkill -f gpg-agent; pkill -f pinentry
      systemctl --user restart gpg-agent{.socket,-extra.socket,-ssh.socket}
    '')
    (pkgs.writeShellScriptBin "minio-login" ''
      kubectl get secret/console-sa-secret -n backups -o json | jq -r ".data.token" | base64 -d
    '')
    (pkgs.writeShellScriptBin "gs" ''
      git status
    '')
    (pkgs.writeShellScriptBin "gc" ''
      git commit -m $1
    '')
    (pkgs.writeShellScriptBin "gp" ''
      git pull origin $1 --rebase
    '')
    (pkgs.writeShellScriptBin "hms" ''
      home-manager switch
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
