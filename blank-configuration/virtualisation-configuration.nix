{ config, pkgs, lib, modulesPath, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings.features.cdi = true;
    };
  };
}