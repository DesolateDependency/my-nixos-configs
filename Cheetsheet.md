# Cheatsheet
## Rebuilding & updating
Rebuild and switch on boot (not updating):
```
sudo nixos-rebuild boot
```
\
Rebuild and switch after finished (not updating):
```
sudo nixos-rebuild switch
```
\
Rebuild, switch after finished, but won't add to bootloader (not updating):
```
sudo nixos-rebuild test
```
\
Update and rebuild:
```
nix-channel --update
sudo nixos-rebuild switch --upgrade
```

## Add user
Add a new user and set a password:
```
sudo useradd -m <username>
sudo passwd <username>
```
\
Add this user to the configuration.nix file
_/etc/nixos/configuration.nix_
```
users.users.<username> = {
  isNormalUser = true;
  extraGroups = [ "wheel" "input" "networkmanager" ];
};
```

## Nix-channel
List all added nix channel
```
sudo nix-channel --list
```
\
Add unstable
```
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel update
```

## System generations
List all system generations:
```
sudo nix-env -p /nix/var/nix/profiles/system --list-generations
```
\
Garbage collect old generations:
```
sudo nix-collect-grabage -d
```
