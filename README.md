# My Dots

## My NixOS Installation

### Preperation
To make the rest of the installation easier we can change the keyboard layout (this step is optional). This setting will not be applyed to the installed system.
```
sudo loadkeys de-latin1
```

### Partitioning

You can see every drive that is connected:
```
lsblk
```
\
The next step is not necessary, but recommendet for security reasons. 
We are overwriting the used drives with random data. This has to be done with every drive that should be used. This will also delete everything that is on the drives beyond recovery.
```
dd if=/dev/urandom of=/dev/<name-of-drive> bs=4096 status=progress
```
\
Now we are getting the disko file to setup the partitions from github (make sure that you are connected with the internet):
```
curl -OL https://raw.githubusercontent.com/DesolateDependency/my-nixos-configs/main/disk-configuration.nix
```
\
Make adjustments to the file, like adjusting the drive names:
```
nano disk-configuration.nix
```
\
Now we are using this file to setup our partitions:
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disk-configuration.nix
```
We can see the result if we check the drives again with `lsblk`

### Nix installation

We have to generate our nix hardware-configuration file because this will be different on every system.
```
sudo nixos-generate-config --root /mnt
```
\
Now we have to replace the automaticaly created configuration.nix file with our own.
```
cd /mnt/etc/nixos/
rm configuration.nix
curl -OL https://raw.githubusercontent.com/DesolateDependency/my-nixos-configs/main/configuration.nix
```

Now we have the chance to adjust the configuration to change things like users.
```
nano configuration.nix
```

Trigger the installation and reboot the system.
```
nixos-install
reboot
```

## Post installation setup

### User setup

Login as the root user.
Now you can change the user password of the user that is created on the configuration.nix.
```
passwd <username>
```
\
Log out the root user.
```
logout
```
\
Login as the user now.

### Setup git (SSH)

Run WM (Hyprland) and open kitty:
```
Hyprland
```
`mod+q`
\
Generate an ssh key in the default location.
```
ssh-keygen
```
\
Got to the public ssh key.
```
cd .ssh/
cat id_ed25519.pub
```
\
Add the ssh key to your github account with the browser.

\
Clone the dotfiles and nix configs.
```
cd
git clone git@github.com:DesolateDependency/My-NixOS-Configs.git .dots
```
\
Copy the hardware-configuration.nix file that was generated for this system into the .nixconfigs directory
```
cp /etc/nixos/hardware-configuration.nix ~/.dots/
```

### Run flake

Rebuild the system with the flake.
```
cd .dots/
sudo nixos-rebuild switch --flake .
```

### Setup and run home manager

Setup the standalone home manager.
```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```
If the install command has a "not found" error, reboot the system and retry.

\
Run home manager.
```
home-manager switch --flake .
```

## Update flake

This recreates the flake.lock file with the newest versions.
```
nix flake update
```
Now you have to rerun the rebuild and home-manager to apply the changes.
