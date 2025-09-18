{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim
    nixd
    pre-commit
  ];
}
