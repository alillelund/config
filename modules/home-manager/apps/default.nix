{pkgs, ...}: {
  home.packages = with pkgs; [
    neovim
    nixd
    yazi
    wslu # Collection of utilities for Windows Subsystem for Linux
  ];
}
