{pkgs, ...}: {
  environment.systemPackages = [
      pkgs.curlWithGnuTls # Needed for Spotify to work proper
      pkgs.libheif  # Support for heif images and video
      pkgs.lmstudio # Language Model Cliet
      pkgs.playerctl # Hyprland control for controlling media
      pkgs.zsa-udev-rules # Required 4 flashing zsa keyboard
  ];
}
