{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "aml";
  home.homeDirectory = "/home/aml";
  

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./modules/home-manager
  ];
 
}
