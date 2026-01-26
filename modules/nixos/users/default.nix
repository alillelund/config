{pkgs, ... }: {
  # programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.aml = {
  #   isNormalUser = true;
  #   description = "aml";
  #   extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "kvm"];
  #   shell = pkgs.zsh;
  # };


  environment.systemPackages = [
    pkgs.xkb-switch
  ];


  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "aml";
}
