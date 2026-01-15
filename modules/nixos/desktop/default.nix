{ pkgs, lib, inputs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = [
    inputs.swww.packages.${pkgs.system}.swww
    pkgs.dunst # Lightweight and customizable notification daemon
    pkgs.nwg-look # GTK settings editor, designed to work properly in wlroots-based Wayland environment
    pkgs.uwsm # Universal wayland session manager
  ];

  xdg.mime.defaultApplications = {
    "image/png" = [
      "eog-2.desktop"
    ];
  };
}
