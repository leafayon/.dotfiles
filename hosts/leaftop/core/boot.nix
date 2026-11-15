{
  boot = {
    initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod"];
    kernelModules = ["kvm-amd"];
    kernelParams = ["i915.enable_guc=3"];
  };
}
