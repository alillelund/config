{ pkgs, ... }: {
  # Enable Steam extras
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;
  
  environment.systemPackages = [
    pkgs.lutris
    pkgs.wine
  ];

}
