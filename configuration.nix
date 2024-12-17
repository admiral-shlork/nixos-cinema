{ ... }:

{
  imports =
    [
      ./blank-configuration/hardware-configuration.nix
      ./blank-configuration/misc-configuration.nix
      ./blank-configuration/networking-configuration.nix
      ./blank-configuration/printing-configuration.nix
      ./blank-configuration/software-configuration.nix
      ./blank-configuration/storage-configuration.nix
    ];
}
