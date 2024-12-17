# New system installation

## Prerequisites

See `fileSystems` config for the host and create necessary partitions. For existing partitions, make sure to update `fileSystems` to reflect how storage is set up.


## Installation

1. Boot NixOS from a Live CD

2. Enter shell with git and vim:

```bash
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#git nixpkgs#vim
```
3. Mount all required partitions under `/mnt`.

- On new hardware, consider  running `nixos-generate-config` and examine the `configuration.nix` and `hardware-configuration.nix` to see if any declarations are required to be added to the configuration.

4. Clone the repo with the configuration:

```bash
git clone ${clone_url_here}
```

5. To install the OS run the following command from the root folder of the cloned repository:

```bash
sudo nixos-install --no-root-passwd --root /mnt  --flake .#cinema
```

6. Set a password for the user:

```bash
nixos-enter --root /mnt -c 'passwd whatever'
```

## Some useful Nix commands:

- Apply configuration from a Flake and rebuild the OS
```bash
sudo nixos-rebuild switch --flake .#cinema
```


- Remove older generations from the bootloader
```bash
nix-collect-garbage --delete-older-than 1d
sudo nixos-rebuild boot --flake .#cinema
```


- Update the flake.lock file and rebuild the system
```bash
nix flake update
sudo nixos-rebuild switch --flake .#cinema
```
