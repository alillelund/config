{
  programs.kitty = {
    enable = true;
    settings = {
      # Theme/color scheme
      # include = "gruvbox-dark-hard.conf";

      # Font configuration
      font_family = "Maple Mono";

      # Kitty uses its own syntax for features like ligatures; they’re usually on by default.
      # If you want to explicitly enable them:
      enable_ligatures = true;

      font_size = 12.0;
    };
  };
}
