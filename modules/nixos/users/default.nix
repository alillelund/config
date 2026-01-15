{pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aml = {
    isNormalUser = true;
    description = "Alexander Marcus Lillelund";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "kvm"];
    shell = pkgs.zsh;
    # packages = with pkgs; [
    #   kdePackages.kate
    # #  thunderbird
    # ];
  };


  environment.systemPackages = [
    pkgs.xkb-switch
  ];

  programs.zsh.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "aml";
}
