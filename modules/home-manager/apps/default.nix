{pkgs, ... }: {
  home.packages = with pkgs; [
    android-studio
    banana-cursor
    bison
    bridge-utils
    code-cursor
    devenv
    discord
    dnsmasq
    edk2
    eog # Eye of Gnome - image viewer
    eza
    firefox
    flex
    gcc # Dep for Neovim
    gimp
    git
    glow # View markdown docs in terminal https://github.com/charmbracelet/glow
    imv
    iptables
    keymapp # Programming ZSA keyboard
    lact
    libreoffice
    libvirt
    mangohud
    mpv
    neofetch
    neovim
    nixd
    p7zip
    pandoc
    qemu
    qemu_kvm
    ripgrep
    signal-desktop
    telegram-desktop
    texliveTeTeX
    virt-manager
    waybar
    wget
    wofi
    wofi-power-menu
    xorg.xhost
    yazi
  ];
}
