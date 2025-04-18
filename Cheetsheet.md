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
