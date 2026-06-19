{ config, pkgs, lib, modulesPath, ... }:

{
  networking = {
    hostName = "cinema";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
  };
}