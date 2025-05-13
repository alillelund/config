{
  pkgs,
  ...
}:{
  programs.starship = {
    enable = true;

    enableZshIntegration = true;
  };
  programs.starship.settings = pkgs.lib.importTOML ./gruvbox-rainbow.toml;
}
