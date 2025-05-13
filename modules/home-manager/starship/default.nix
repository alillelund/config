{
  pkgs,
  ...
}:{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.starship.settings = pkgs.lib.importTOML ./gruvbox-rainbow.toml;
  programs.starship.settings = {
    nix_shell = {
      symbol = "";
      format = "[$symbol$name]($style) ";
      style = "bright-purple bold";
      heuristic = true;
    };
  };
}
