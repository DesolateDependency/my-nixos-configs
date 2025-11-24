{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    virtio-win
    spice
    spice-gtk
    spice-protocol
    win-spice
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        vhostUserPackages = with pkgs; [ virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
}