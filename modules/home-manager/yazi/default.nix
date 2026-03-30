# default.nix - Home Manager module for Yazi with Gruvbox theme
{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = {
      manager = {
        show_hidden = false;
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_symlink = true;
      };

      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
      };

      opener = {
        edit = [
          { run = ''$EDITOR "$@"''; block = true; for_ = "unix"; }
        ];
        open = [
          { run = ''xdg-open "$@"''; desc = "Open"; for_ = "linux"; }
        ];
      };
    };

    theme = {
      manager = {
        cwd             = { fg = "#a9b665"; };

        hovered         = { fg = "#282828"; bg = "#a9b665"; };
        preview_hovered = { underline = true; };

        find_keyword    = { fg = "#d8a657"; italic = true; };
        find_position   = { fg = "#d3869b"; bg = "reset"; italic = true; };

        marker_selected = { fg = "#a9b665"; bg = "#a9b665"; };
        marker_copied   = { fg = "#d8a657"; bg = "#d8a657"; };
        marker_cut      = { fg = "#ea6962"; bg = "#ea6962"; };

        tab_active      = { fg = "#282828"; bg = "#a9b665"; };
        tab_inactive    = { fg = "#d4be98"; bg = "#3c3836"; };
        tab_width       = 1;

        border_symbol   = "│";
        border_style    = { fg = "#665c54"; };

        count_copied    = { fg = "#282828"; bg = "#d8a657"; };
        count_cut       = { fg = "#282828"; bg = "#ea6962"; };
        count_selected  = { fg = "#282828"; bg = "#a9b665"; };
      };

      status = {
        separator_open  = "";
        separator_close = "";

        separator_style = { fg = "#3c3836"; bg = "#3c3836"; };

        mode_normal     = { fg = "#282828"; bg = "#a9b665"; bold = true; };
        mode_select     = { fg = "#282828"; bg = "#d8a657"; bold = true; };
        mode_unset      = { fg = "#282828"; bg = "#d3869b"; bold = true; };

        progress_label  = { fg = "#d4be98"; bold = true; };
        progress_normal = { fg = "#504945"; bg = "#3c3836"; };
        progress_error  = { fg = "#ea6962"; bg = "#3c3836"; };

        permissions_t   = { fg = "#a9b665"; };
        permissions_r   = { fg = "#d8a657"; };
        permissions_w   = { fg = "#ea6962"; };
        permissions_x   = { fg = "#a9b665"; };
        permissions_s   = { fg = "#665c54"; };
      };

      input = {
        border   = { fg = "#a9b665"; };
        title    = {};
        value    = {};
        selected = { reversed = true; };
      };

      select = {
        border   = { fg = "#7daea3"; };
        active   = { fg = "#d3869b"; };
        inactive = {};
      };

      tasks = {
        border  = { fg = "#7daea3"; };
        title   = {};
        hovered = { underline = true; };
      };

      which = {
        mask    = { bg = "#3c3836"; };
        cand    = { fg = "#7daea3"; };
        rest    = { fg = "#928374"; };
        desc    = { fg = "#d3869b"; };
        separator       = "  ";
        separator_style = { fg = "#504945"; };
      };

      help = {
        on      = { fg = "#d3869b"; };
        run     = { fg = "#7daea3"; };
        desc    = { fg = "#928374"; };
        hovered = { bg = "#504945"; bold = true; };
        footer  = { fg = "#3c3836"; bg = "#d4be98"; };
      };

      filetype = {
        rules = [
          # Images
          { mime = "image/*"; fg = "#7daea3"; }
          # Videos
          { mime = "video/*"; fg = "#d8a657"; }
          # Audio
          { mime = "audio/*"; fg = "#d8a657"; }
          # Archives
          { mime = "application/zip";       fg = "#d3869b"; }
          { mime = "application/gzip";      fg = "#d3869b"; }
          { mime = "application/x-tar";     fg = "#d3869b"; }
          { mime = "application/x-bzip2";   fg = "#d3869b"; }
          { mime = "application/x-7z-compressed"; fg = "#d3869b"; }
          { mime = "application/x-rar";     fg = "#d3869b"; }
          # Documents
          { mime = "application/pdf";       fg = "#a9b665"; }
          { mime = "application/doc";       fg = "#a9b665"; }
          # Fallback
          { name = "*"; fg = "#d4be98"; }
          { name = "*/"; fg = "#a9b665"; bold = true; }
        ];
      };
    };

    keymap = {
      manager.keymap = [
        { on = [ "q" ];       run = "quit";            desc = "Quit"; }
        { on = [ "<Esc>" ];   run = "escape";          desc = "Exit visual/search mode"; }

        # Navigation
        { on = [ "k" ];       run = "arrow -1";        desc = "Move up"; }
        { on = [ "j" ];       run = "arrow 1";         desc = "Move down"; }
        { on = [ "K" ];       run = "arrow -5";        desc = "Move up 5"; }
        { on = [ "J" ];       run = "arrow 5";         desc = "Move down 5"; }
        { on = [ "h" ];       run = "leave";           desc = "Go to parent"; }
        { on = [ "l" ];       run = "enter";           desc = "Enter directory"; }
        { on = [ "<Up>" ];    run = "arrow -1";        desc = "Move up"; }
        { on = [ "<Down>" ];  run = "arrow 1";         desc = "Move down"; }
        { on = [ "<Left>" ];  run = "leave";           desc = "Go to parent"; }
        { on = [ "<Right>" ]; run = "enter";           desc = "Enter directory"; }

        # Selection
        { on = [ "<Space>" ]; run = [ "select --state=none" "arrow 1" ]; desc = "Toggle select"; }
        { on = [ "v" ];       run = "visual_mode";     desc = "Enter visual mode"; }
        { on = [ "V" ];       run = "visual_mode --unset"; desc = "Enter visual mode (unset)"; }

        # Operations
        { on = [ "o" ];       run = "open";            desc = "Open file"; }
        { on = [ "<Enter>" ]; run = "open";            desc = "Open file"; }
        { on = [ "y" ];       run = "yank";            desc = "Yank (copy)"; }
        { on = [ "x" ];       run = "yank --cut";      desc = "Yank (cut)"; }
        { on = [ "p" ];       run = "paste";           desc = "Paste"; }
        { on = [ "P" ];       run = "paste --force";   desc = "Paste (overwrite)"; }
        { on = [ "d" ];       run = "remove";          desc = "Trash file"; }
        { on = [ "D" ];       run = "remove --permanently"; desc = "Delete permanently"; }
        { on = [ "a" ];       run = "create";          desc = "Create file/dir"; }
        { on = [ "r" ];       run = "rename";          desc = "Rename"; }

        # Find/Filter
        { on = [ "/" ];       run = "find --smart";    desc = "Find"; }
        { on = [ "f" ];       run = "filter --smart";  desc = "Filter"; }

        # Sort
        { on = [ "," "m" ];   run = "sort modified --dir-first"; desc = "Sort by modified"; }
        { on = [ "," "n" ];   run = "sort natural --dir-first";  desc = "Sort by name"; }
        { on = [ "," "s" ];   run = "sort size --dir-first";     desc = "Sort by size"; }
        { on = [ "," "e" ];   run = "sort extension --dir-first"; desc = "Sort by extension"; }

        # Tabs
        { on = [ "t" ];       run = "tab_create --current"; desc = "New tab"; }
        { on = [ "1" ];       run = "tab_switch 0";    desc = "Switch to tab 1"; }
        { on = [ "2" ];       run = "tab_switch 1";    desc = "Switch to tab 2"; }
        { on = [ "3" ];       run = "tab_switch 2";    desc = "Switch to tab 3"; }

        # Goto
        { on = [ "g" "h" ];   run = "cd ~";            desc = "Go home"; }
        { on = [ "g" "c" ];   run = "cd ~/.config";    desc = "Go to .config"; }
        { on = [ "g" "d" ];   run = "cd ~/Downloads";  desc = "Go to Downloads"; }
        { on = [ "g" "t" ];   run = "cd /tmp";         desc = "Go to /tmp"; }

        # Toggle hidden
        { on = [ "." ];       run = "hidden toggle";   desc = "Toggle hidden files"; }
      ];
    };
  };
}

