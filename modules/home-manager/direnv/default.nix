{pkgs, ...}: {
  home.packages = with pkgs; [direnv];

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["direnv"];
}
