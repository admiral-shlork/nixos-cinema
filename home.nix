{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./home-configuration/gnome-configuration.nix
      ./home-configuration/starship-configuration.nix
    ];

  # Home Manager configuration options go here
  home = {
    username = "blah";
    homeDirectory = "/home/blah";
    stateVersion = "24.11";
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
      gnome-screenshot
      # jetbrains.pycharm-community
      jellyfin-media-player
      # keepassxc
      # libreoffice
      # librewolf
      # lutris
      # mangohud
      # megasync
      moonlight-qt
      # obsidian
      # parsec-bin
      # protonvpn-gui
      # signal-desktop
      # soulseekqt
      # soundconverter
      # steam
      # telegram-desktop
      # thunderbird
      # winbox
      # virtualbox
      vivaldi
      # veracrypt
      vlc
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
