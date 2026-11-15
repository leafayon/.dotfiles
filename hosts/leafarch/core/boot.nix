{
  boot = {
    initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
    initrd.kernelModules = [];

    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    supportedFilesystems = ["ntfs"];
  };
}