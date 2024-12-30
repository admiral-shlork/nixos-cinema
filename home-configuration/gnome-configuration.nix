{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    # GNOME 46: triple-buffering-v4-46
    (final: prev: {
      mutter = prev.mutter.overrideAttrs (old: {
        src = pkgs.fetchFromGitLab  {
          domain = "gitlab.gnome.org";
          owner = "vanvugt";
          repo = "mutter";
          rev = "triple-buffering-v4-46";
          hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
        };
      });
    })
  ];

  dconf.settings = {
    # Disable location
    "org/gnome/system/location" = {
      enabled = false;
    };
    # Disable lock screen and notifications
    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
      show-banners = false;
    };
    "org/gnome/desktop/lockdown".disable-lock-screen = true;
    "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0; # Disable screen blanking
    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
      idle-activation-enabled = false;
    };
    # Enabled extensions
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        caffeine.extensionUuid
        dash-to-panel.extensionUuid
        date-menu-formatter.extensionUuid
        appindicator.extensionUuid
        no-overview.extensionUuid
      ];
    };

    # Date-menu-formatter preferences
    "org/gnome/shell/extensions/date-menu-formatter" = {
      pattern = "EEEE  -  d  MMMM  -  HH:mm:ss";
      text-align = "right";
      update-level = "2";
    };
    # Caffeine preferences
    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = "2";
      restore-state = true;
      show-indicator = "always";
      show-notifications = false;
    };
    # Sound preferences
    "org/gnome/desktop/sound".allow-volume-above-100-percent = true;
    # Fractional scaling in Gnome
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}