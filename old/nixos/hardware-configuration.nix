{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/5e57ff07-d61d-4875-8ff4-d731fa681021";
    fsType = "btrfs";
    options = [ "compress=zstd" "noatime" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/58e53092-f312-4c8a-9f02-8083c2288ac6";
    fsType = "btrfs";
    options = [ "compress=zstd" "noatime" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/5e57ff07-d61d-4875-8ff4-d731fa681021";
    fsType = "btrfs";
    options = [ "subvol=nix" "compress=zstd" "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/EDF7-789B";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  zramSwap.enable = true;
  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
