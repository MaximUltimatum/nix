{ config, pkgs, ... }:
{
  programs.kubecolor = {
    enable = true;
    enableAlias = true;
  };

  home.packages = with pkgs; [
    # k8s
    kubectl
    kubectx
    kubectl-view-secret
    k9s
    kubeseal
    talosctl

    # work with your friends
    tmate
    
    (writeShellScriptBin "vim" ''
      nvim $@
    '')
    (writeShellScriptBin "lg" ''
      lazygit
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
