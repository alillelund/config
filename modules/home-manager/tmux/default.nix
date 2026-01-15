{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    historyLimit = 500000;
    baseIndex = 1;
    keyMode = "emacs";
    mouse = true;
    extraConfig = ''
      # Fix terminal colors
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Renumber windows
      set -g renumber-windows on

      # Disable window renaming
      set-option -g allow-rename off

      # Vim copy-pasta
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # Open panes in current directory
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      set-window-option -g aggressive-resize off

      # Jump to prompts
      bind -T copy-mode n send-keys -X next-prompt -o
      bind -T copy-mode p send-keys -X previous-prompt -o

      # Clear history
      bind -n C-k clear-history

      # Top status bar
      set -g status-position bottom
    '';
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      # olimorris/tmux-pomodoro-plus
      # yank
      # tmux-fzf
      # jump
    ];
  };

  # Zsh plugin
  programs.zsh.oh-my-zsh.plugins = ["tmux"];
}
