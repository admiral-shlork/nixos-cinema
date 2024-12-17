{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./home-configuration/gnome-configuration.nix
      ./home-configuration/starship-configuration.nix
    ];

  # Home Manager configuration options go here
  home = {
    username = "whatever";
    homeDirectory = "/home/whatever";
    stateVersion = "24.05";
    packages = with pkgs; [
      # audacity
      # calibre
      # deadbeef-with-plugins
      # deluge-gtk
      # discord
      # docker
      # dropbox
      # easytag
      # element-desktop
      # evince
      # firefox-devedition
      # gimp
      gnome.gnome-screenshot
      # jetbrains.pycharm-community
      # keepassxc
      # libreoffice
      # librewolf
      # lutris
      # mangohud
      # megasync
      nerdfonts
      # obsidian
      # parsec-bin
      # protonvpn-gui
      # signal-desktop
      # soulseekqt
      # soundconverter
      # steam
      # telegram-desktop
      # thunderbird
      # ungoogled-chromium
      # winbox
      # virtualbox
      # vivaldi
      # veracrypt
      # vlc
      # yacreader
    ];
    # shellAliases = {
    #   ll="ls -alhF";
    #   la="ls -A";
    #   l="ls -CF";
    # };
  };
  programs.bash = {
    enable = true;
    initExtra = ''
      alias ll='ls -alhF'
      alias la='ls -A'
      alias l='ls -CF'
    '';
  };
}
