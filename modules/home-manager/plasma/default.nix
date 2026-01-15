{
  programs.plasma = {
    enable = true;
    # overrideConfig = true;
    workspace = {
      clickItemTo = "select";
      cursor.theme = "Banana";
      cursor.size = 70;
    };
    kwin = {
      nightLight = {
        enable = true;
        mode = "times";
        time = {
          morning = "06:30";
          evening = "19:30";
        };
        transitionTime = 30;
      };
    };
  };
}
