# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../base/desktop.nix
    ../../base/desktop-environment.nix
    ../../hardware/bluetooth.nix
    ../../vpn.nix
    ../../yubikeys.nix   # Only use after creating ~/.config/Yubico/u2f_keys file! + indirectly locks root user :)
    ../../virtual-machines.nix   # Add libvirtd to usergroups!
    ../../gaming.nix
    ../../printing-scanning.nix
    ../../fonts.nix
    ../../crypto.nix
    ../../flatpak.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.desdpy = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" # Enable ‘sudo’ for the user.
      "input" 
      "networkmanager" 
      "libvirtd" # Enable virtualisation for virt-manager
      "scanner" # For scanning documents
      "lp" # For printing documents
    ]; 
  };

  swapDevices = [ {
    device = "/.swapvol/swapfile";
    size = 16*1024;
  } ];

  # Define your hostname.
  networking.hostName = "unwired";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

