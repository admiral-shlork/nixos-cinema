# Help is available in the configuration.nix(5) man page and 
# in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Define your user-specific home configuration
  users.users.whatever = {
    isNormalUser = true;
    home = "/home/whatever";
    # Add more configurations for your user here
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    brlaser
    git
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-panel
    gnomeExtensions.date-menu-formatter
    gnomeExtensions.no-overview
    home-manager
    nh
    terminator
    vim
    vscodium
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Minimal gnome installation
  environment.gnome.excludePackages =
    (with pkgs; [
      gedit
      gnome-console
      gnome-connections
      gnome-photos
      gnome-tour
      simple-scan
      snapshot
      yelp
    ])
    ++ (with pkgs.gnome; [
      atomix
      cheese
      epiphany
      evince
      geary
      gnome-calendar
      gnome-characters
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-software
      gnome-terminal
      gnome-weather
      hitori
      iagno
      tali
      totem
    ]);
}
