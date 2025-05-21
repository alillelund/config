# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000;
  environment.systemPackages = with pkgs; [
    # Flakes clones its dependencies through the git command,
    # so git must be installed first
    eza
    gh
    git
    helix
    neofetch
    ripgrep
    stow
    thefuck
    wget
  ];
  # Set the default editor to vim
  environment.variables.EDITOR = "nvim";  
  environment.localBinInPath = true; # add to configuration.nix

  # Automatic updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  # Automatic cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  # nix.settings.auto-optime-store = true;

  # Set timezone
  # services.automatic-timezoned.enable = true;
  time.timeZone = "Europe/Copenhagen";

  system.stateVersion = "24.11"; # Did you read the comment?
}
