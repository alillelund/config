{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
       ll = "eza -alh --icons --git --group-directories-first";
       ls = "eza";
       update = "sudo nix flake update && sudo nixos-rebuild switch --upgrade && sudo nixos-rebuild switch --impure --flake /etc/nixos/";
       vi = "nvim";
     };

     oh-my-zsh = {
        enable = true;
        plugins = ["git"];
     };
  };
}
