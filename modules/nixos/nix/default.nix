{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.download-buffer-size = 500000000;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    substituters = ["https://hyprland.cachix.org" "https://devenv.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
  };

  environment.systemPackages = [
      pkgs.psmisc
  ];
}
