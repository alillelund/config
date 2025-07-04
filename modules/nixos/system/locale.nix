let
  formatting = "da_DK.UTF-8";
in {
  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = formatting;
    LC_IDENTIFICATION = formatting;
    LC_MEASUREMENT = formatting;
    LC_MONETARY = formatting;
    LC_NAME = formatting;
    LC_NUMERIC = formatting;
    LC_PAPER = formatting;
    LC_TELEPHONE = formatting;
    LC_TIME = formatting;
  };
}
