{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kubectl
    argo
    openshift
  ];

 programs.k9s = {
   enable = true;
 };

 programs.zsh.oh-my-zsh.plugins = ["kubectl, argocd, oc"];
}
