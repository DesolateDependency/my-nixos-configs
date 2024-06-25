# this is a disko setup config to create my partitions with lvm on luks
{
    disko.devices = { # ----------------------------------------------> holds the overall categories (disk, mdadm, lvm_vg[volume groups])
        disk = { # ---------------------------------------------------> all disks installed in the system like SSDs, HHDs, M.2s etc.
            nvme0n1 = { # --------------------------------------------> disk installed in a NVM Express port (name freely selectable)
                type = "disk"; # -------------------------------------> marks "nvme0n1" as a disk
                device = "/dev/nvme0n1"; # ---------------------------> path to the defined disk
                content = { # ----------------------------------------> contains everything that should happen on this disk
                    type = "gpt"; # ----------------------------------> partitioning style (GUID Partition Table [gpt] or Master Boot Record [mbr])
                    partitions = { # ---------------------------------> partitions created on this disk

                        # EFI partition
                        ESP = { # ------------------------------------> define EFI partition (name freely selectable)
                            size = "1024M"; # ------------------------> absolute size for this partition
                            type = "EF00"; # -------------------------> type of the partition "ef00" marks it as efi partition for booting
                            content = { # ----------------------------> contains everything that should happen on this partition
                                type = "filesystem"; # ---------------> role for this partition
                                format = "vfat"; # -------------------> fromat as this filesystem
                                mountpoint = "/boot"; # --------------> mounted here
                            };
                        };

                        # luks partition
                        luks = { # -----------------------------------> define luks partition (name freely selectable)
                            size = "100%"; # -------------------------> takes all of the remaining space of this disk for this patition
                            content = { # ----------------------------> contains everything that should happen on this partition
                                type = "luks"; # ---------------------> role for this partition
                                name = "crypted"; # ------------------> name of partition
                                extraOpenArgs = [ ]; # ---------------> ???
                                settings = { # -----------------------> settings for this luks partition
                                    allowDiscards = true; # ----------> ???
                                };
                                content = { # ------------------------> contains everything that should happen on this partition
                                    type = "lvm_pv"; # ---------------> role for this partition
                                    vg = "volgroup"; # ---------------> which volume group should be inserted here
                                };
                            };
                        };
                    };
                };
            };
        };

        # volume groups
        lvm_vg = { # -------------------------------------------------> all volume groups for lvm
            volgroup = { # -------------------------------------------> define volume group (name freely selectable)
                type = "lvm_vg"; # -----------------------------------> defines this as a volume group

                # logical volumes
                lvs = { # --------------------------------------------> all logical volumes in this volume group

                    # swap partition
                    swap = { # ---------------------------------------> define swap partition (name freely selectable)
                        size = "16G"; # ------------------------------> absolute size for this logical volume
                        content = { # --------------------------------> contains everything that should happen on this partition
                            type = "swap"; # -------------------------> role for this partition
                            discardPolicy = "both"; # ----------------> ???
                            resumeDevice = true; # -------------------> resume from hiberation from this device
                        };
                    };

                    # root partition
                    root = { # ---------------------------------------> define root partition (name freely selectable)
                        size = "32G"; # ------------------------------> absolute size for this logical volume
                        content = { # --------------------------------> contains everything that should happen on this partition
                            type = "filesystem"; # -------------------> role for this partition
                            format = "ext4"; # -----------------------> fromat as this filesystem
                            mountpoint = "/"; # ----------------------> mounted here
                        };
                    };

                    # home partition
                    home = { # ---------------------------------------> define home partition (name freely selectable)
                        size = "100%FREE"; # -------------------------> takes all of the remaining space in this volume group for this logical volume
                        content = { # --------------------------------> contains everything that should happen on this partition
                            type = "filesystem"; # -------------------> role for this partition
                            format = "ext4"; # -----------------------> fromat as this filesystem
                            mountpoint = "/home"; # ------------------> mounted here
                        };
                    };
                };
            };
        };
    };
}
