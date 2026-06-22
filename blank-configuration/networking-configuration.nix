{ config, lib, modulesPath, pkgs, ... }:

{
  networking = {
    hostName = "cinema";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [ 9000 ];
      allowedUDPPorts = [ ];
      trustedInterfaces = [  ];
    };
  };
}