{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "ie";
        variant = "";
      };
    };
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    openssh.enable = true;
  };

  programs = {
    firefox.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      brlaser
      git
      dconf-editor
      direnv
      gnomeExtensions.appindicator
      gnomeExtensions.caffeine
      gnomeExtensions.dash-to-panel
      gnomeExtensions.date-menu-formatter
      gnomeExtensions.no-overview
      home-manager
      moonlight-qt
      nh
      pciutils
      terminator
      vim
      vivaldi
      vlc
      vscodium
      wget
    ];
    gnome.excludePackages =
      (with pkgs; [
        atomix
        cheese
        epiphany
        evince
        geary
        gedit
        gnome-calendar
        gnome-characters
        gnome-connections
        gnome-console
        gnome-contacts
        gnome-maps
        gnome-music
        gnome-photos
        gnome-software
        gnome-terminal
        gnome-tour
        gnome-weather
        hitori
        iagno
        simple-scan
        snapshot
        tali
        totem
        yelp
      ]);
  };

  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.droid-sans-mono
  ];
}
