{
  pkgs,
  username,
  ssh-keys,
  ...
}: {
  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    shellInit = ''
        git config --global core.sshCommand "/mnt/c/Windows/System32/OpenSSH/ssh.exe"
    '';
  };

}
