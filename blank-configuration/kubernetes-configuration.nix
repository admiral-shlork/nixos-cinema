{ config, pkgs, ... }:
let
  kubeMasterIP = "10.0.0.107";
  kubeMasterHostname = "master.micro-slab";
  kubeMasterAPIServerPort = 6443;
  kubeMasterAPI = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
in
{
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";
  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = {
    roles = ["node"];
    masterAddress = kubeMasterHostname;
    easyCerts = true;
    kubelet.kubeconfig.server = kubeMasterAPI;
    apiserverAddress = kubeMasterAPI;
    addons.dns.enable = true;
    kubelet.extraOpts = "--fail-swap-on=false --cgroup-driver=systemd";
  };
}
