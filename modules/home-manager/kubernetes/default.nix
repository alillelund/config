{
  pkgs,
  k9s-catppuccin,
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
}
