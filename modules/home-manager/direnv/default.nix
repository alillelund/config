{
  programs.direnv = {
    enable = true;
  };

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["direnv"];
}
