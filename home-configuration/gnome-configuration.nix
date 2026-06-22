{ config, lib, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/system/location" = {
      enabled = false;
    };
    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
      show-banners = false;
    };
    "org/gnome/desktop/lockdown".disable-lock-screen = true;
    "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
      idle-activation-enabled = false;
    };
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
    "org/gnome/shell/extensions/date-menu-formatter" = {
      pattern = "EEEE  -  d  MMMM  -  HH:mm:ss";
      text-align = "right";
      update-level = "2";
    };
    "org/gnome/shell/extensions/caffeine" = {
      indicator-position-max = "2";
      restore-state = true;
      show-indicator = "always";
      show-notifications = false;
    };
    "org/gnome/desktop/sound".allow-volume-above-100-percent = true;
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}
